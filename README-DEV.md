# Development approach and scripts

- [Idea / heuristic](#idea--heuristic)
- [Tooling](#tooling)
- [Comparing instances/states](#comparing-instancesstates)
- [Developing a script to transform "external" state into "internal" state](#developing-a-script-to-transform-external-state-into-internal-state)

See [README.md](./README.md) for an overview first.

## Idea / heuristic

Assume there are two identical Immich setups.
- On the first instance, `immich-ext`, we add `image.jpg` to external library.
- On the second instance, `immich-int`, we upload `image.jpg` through web or mobile.

This tool aims to convert database records and move asset files in `immich-ext` to mirror structure `immich-int`, making external assets appear as imported into internal library. Thus, effectively converting assets from being "external" into "internal" kind.
Ultimate goal: external library -> this migration tool -> internal library.

By comparing those two instances, in particular:
- SQL databases (Postgres dumps)
- File system content/locations

we can deduce what the migration tool should do.

## Tooling

For comparing records in Postgresql databases see [How to compare data between two databases in PostgreSQL?](https://stackoverflow.com/questions/4804779/how-to-compare-data-between-two-databases-in-postgresql) at stackoverflow. 
For the sake of simplicity I used basic plain text comparison/diff of SQL data dumps.

## Comparing instances/states

#### 1. Create new Immich instance.

```sh
cd immich
curl -sSL -o docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml
curl -sSL -o .env https://github.com/immich-app/immich/releases/latest/download/example.env
docker compose up -d immich-server database redis
```

Add volume definitions. Tweak docker compose file (enable debug logging).

For an example see my `docker-compose.override.yml` in `./immich` folder in the project repo. It will be automatically picked by docker compose.

Logs:
```sh
docker compose logs --tail 20 -f immich-server database
```

#### 2. Configure new Immich instance.

Access at http://localhost:2283. Credentials: admin@local / admin@local.

2.1. Enable Storage Template.

Use preset `2022/2022-02/IMAGE_56437` / template `{{y}}/{{y}}-{{MM}}/{{filename}}` for the "YYYY/YYYY-MM" layout.

In Admin Settings verify that "Enable storage template engine" is active.

2.2. Create an external library with path: `/tmp/extvol/media`.

2.3. Create an album.

Do not add/import/upload any images yet.

2.4. Configure other features as needed.

For example, enable Folders, enable Face Import, disable Machine Learning.

Remove containers
```sh
docker compose down -v
```

#### 3. Clone it into two instances: int and ext.

```sh
cp -r immich immich-int
cp -r immich immich-ext
```

#### 4. Setup `immich-int`.

4.1. Start

```sh
cd immich-int
docker compose up -d immich-server database redis
```

4.2. Connect to http://localhost:2283 and log in as "admin@local" with password "admin@local".

4.3. Upload `image.jpg`.

Make sure the file appears in the internal `YYYY/YYYY-MM` folder. Check in UI (image info panel or Folders) or in filesystem (`tree /tmp/extvol/library`) or in the database:
```sh
docker compose exec database psql -U postgres -Ppager=no -d immich
select "originalPath" from assets;
```
```
                originalPath                 
---------------------------------------------
 upload/library/admin/2025/2025-03/image.jpg
```

Add the image to the album from Step 2.3.

4.4. Take SQL dump of the Immich database:

Normalize the `image.jpg` UUID to make UUIDs identical in both dumps for ease of comparison.

```sh
UUID=$(docker compose exec database psql -U postgres -d immich --tuples-only --csv -c "select id from assets")
ZERO=00000000-0000-0000-0000-000000000000
docker compose exec database pg_dump -U postgres --data-only --exclude-table=geodata_places --exclude-table=naturalearth_countries immich \
  | sed "s/$UUID/$ZERO/g" > ../sql/dump-int.sql
```

4.5. Remove containers

```sh
docker compose down -v
```

#### 5. Setup `immich-ext`.

5.1. Start

```sh
cd immich-ext
docker compose up -d immich-server database redis
```

5.2. Connect to http://localhost:2283 and log in as "admin@local" with password "admin@local".

5.3. Add `image.jpg` to the external library folder on host.

Put the file into the corresponding `YYYY/YYYY-MM` subfolder.
```sh
DIR=/tmp/extvol/media/2025/2025-03
mkdir -p "$DIR"
cp image.jpg "$DIR"
tree /tmp/extvol/media
```
Rescan the library.

Add the image to the album from Step 2.3.

5.4. Take SQL dump of the Immich database.

Normalize the `image.jpg` UUID to make UUIDs identical in both dumps for ease of comparison.

```sh
UUID=$(docker compose exec database psql -U postgres -d immich --tuples-only --csv -c "select id from assets")
ZERO=00000000-0000-0000-0000-000000000000
docker compose exec database pg_dump -U postgres --data-only --exclude-table=geodata_places --exclude-table=naturalearth_countries immich \
  | sed "s/$UUID/$ZERO/g" > ../sql/dump-ext.sql
```

5.5. Remove containers

```sh
docker compose down -v
```

#### 6. Compare SQL dumps.

#### 7. Check asset file paths on "ext" and "int" and note them.

## Developing a script to transform "external" state into "internal" state

For PoC we iterate over all records and
- update the asset SQL records
- generate shell commands to move/copy the asset files from external library to internal location.

Assumptions/disclaimer:
- No explicit handling of thumbnails. May need to regenerate them upon migration.
- No extensive testing.
- No safeguards against injections in PoC. No proper handling (escaping, filtering) of input data.
- The stored procedure written with assistance of Qwen3.
