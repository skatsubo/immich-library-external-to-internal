#!/bin/bash

#
# vars
#
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
stor_proc_file="$script_dir/migrate-assets-external-to-internal.sql"

#
# functions
#
log() {
   printf '%s\n' "$@" >&2 
}

exec_query() {
    query="$1"
    # log only first line
    log "Execute SQL query: ${query%%$'\n'*} <...>"
    docker compose exec -T database psql -U postgres -d immich -c "$query"
}

# /tmp/extvol/media/2025/2025-03/image.jpg -> \xf73a17059f4aedaeef82579b8ee58bcb18c7f90b
sha1_file() {
    path="$1"
    log "Calculate sha1 for: $path"
    sha1sum "$path" | awk '{print "\\x" $1}'
}

#
# main
#
log "1. Add stored proc migrate_assets_external_to_internal()"
exec_query "$(<"$stor_proc_file")"

log "2. Migrate assets in the database: dry run"
exec_query "CALL migrate_assets_external_to_internal()"

log "2a. Review dry run history: SELECT * from migrate_assets_external_to_internal_history;"

log "3. To actually migrate assets in the database (non-dry run) execute: CALL migrate_assets_external_to_internal(dry_run => false);"
# exec_query "CALL migrate_assets_external_to_internal(dry_run => false)"

log "4. To move/copy assets on disk use mv_command/cp_command from the history table: SELECT * from migrate_assets_external_to_internal_history;"

log "5. (TODO) Update checksum of migrated assets using something like sha1_file() in this script"
