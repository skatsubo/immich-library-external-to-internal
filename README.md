# Migrate Immich assets from external library to internal library

This is a proof of concept (PoC) for SQL-based conversion/migration of assets from external library into internal library (uploads). 

Post-migration, images initially from external libraries will appear as if uploaded/imported into the internal library.
But without re-uploading / re-import, thus preserving asset UUIDs and albums.

Why do that? Discussed in [Upload and External library in same folder #19853](https://github.com/immich-app/immich/discussions/19853).

## How to use

Go to the Immich docker compose directory.

Dry run, it will create a history table with planned updates:

```sh
sh /path/to/repo/migrate.sh
```

### How to check history / planned changes

The history table:

```sql
SELECT * from migrate_assets_external_to_internal_history;

-[ RECORD 1 ]-----+--------------------------------------------------------------------------------------------
asset_id          | 67e5b712-7707-4caa-b871-c4b2e525ff82
old_originalpath  | /tmp/extvol/media/2025/2025-03/image.jpg
new_originalpath  | upload/library/admin/2025/2025-03/image.jpg
old_deviceassetid | image.jpg
new_deviceassetid | web-image.jpg-1753049128389
old_deviceid      | Library Import
new_deviceid      | Ext2int
old_isexternal    | t
new_isexternal    | f
is_skipped        | f
skip_reason       | 
cp_command        | cp "/tmp/extvol/media/2025/2025-03/image.jpg" "upload/library/admin/2025/2025-03/image.jpg"
mv_command        | mv "/tmp/extvol/media/2025/2025-03/image.jpg" "upload/library/admin/2025/2025-03/image.jpg"
created_at        | 2025-07-20 22:05:28.388696+00
```

## Development

See [README-DEV.md](./README-DEV.md).

> [!WARNING] 
> This is a quick PoC. It is not secure against SQL injections, shell injections and other irregularities in data.
