-- migration: stored proc
-- CALL migrate_assets_external_to_internal();
CREATE OR REPLACE PROCEDURE migrate_assets_external_to_internal(dry_run BOOLEAN DEFAULT true)
LANGUAGE plpgsql
AS $$
DECLARE
  current_time_ms BIGINT;
  rec RECORD;
  matched_prefix TEXT;
  relative_path TEXT;
  new_originalPath TEXT;
  new_deviceAssetId TEXT;
  new_deviceId TEXT;
  new_isExternal BOOLEAN := false;
  cp_cmd TEXT;
  mv_cmd TEXT;
BEGIN

  -- migration: history
  -- TODO: drop+create?
  CREATE TABLE IF NOT EXISTS migrate_assets_external_to_internal_history (
    asset_id UUID PRIMARY KEY,
    old_originalPath TEXT NOT NULL,
    new_originalPath TEXT,
    old_deviceAssetId TEXT NOT NULL,
    new_deviceAssetId TEXT,
    old_deviceId TEXT NOT NULL,
    new_deviceId TEXT,
    old_isExternal BOOLEAN NOT NULL,
    new_isExternal BOOLEAN,
    is_skipped BOOLEAN NOT NULL DEFAULT false,
    skip_reason TEXT,
    cp_command TEXT,
    mv_command TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
  );
  TRUNCATE TABLE migrate_assets_external_to_internal_history;

  -- Get current time in milliseconds once for all updates
  SELECT (EXTRACT(EPOCH FROM NOW())::double precision * 1000)::bigint INTO current_time_ms;

  -- Loop through all assets with isExternal = true and associated library
  FOR rec IN
    SELECT
      a.id AS asset_id,
      a."originalPath",
      a."deviceAssetId",
      a."deviceId",
      a."isExternal",
      a."ownerId",
      a."libraryId",
      l."importPaths",
      u."storageLabel"
    FROM assets a
    JOIN libraries l ON a."libraryId" = l.id
    JOIN users u ON a."ownerId" = u.id
    WHERE a."isExternal" = true
  LOOP
    matched_prefix := NULL;

    -- Try each importPath in the importPaths array to find a match
    FOR i IN 1..array_length(rec."importPaths", 1)
    LOOP
      IF starts_with(rec."originalPath", rec."importPaths"[i]) THEN
        matched_prefix := rec."importPaths"[i];
        EXIT;
      END IF;
    END LOOP;

    -- If a match was found, perform the update and log history
    IF matched_prefix IS NOT NULL THEN
      relative_path := substring(rec."originalPath" FROM length(matched_prefix) + 1);
      new_originalPath := 'upload/library/' || rec."storageLabel" || relative_path;
      new_deviceAssetId := 'web-' || rec."deviceAssetId" || '-' || current_time_ms::text;
      new_deviceId := 'Ext2int';
      new_isExternal := false;

      -- Perform the update if dry_run = false
      IF NOT dry_run THEN
        UPDATE assets
        SET
          "originalPath" = new_originalPath,
          "deviceAssetId" = new_deviceAssetId,
          "deviceId" = new_deviceId,
          "isExternal" = new_isExternal
        WHERE id = rec.asset_id;
      END IF;

      -- History, including shell commands for moving/copying asset files
      cp_cmd := 'cp "' || rec."originalPath" || '" "' || new_originalPath || '"';
      mv_cmd := 'mv "' || rec."originalPath" || '" "' || new_originalPath || '"';
      INSERT INTO migrate_assets_external_to_internal_history (
        asset_id, old_originalPath, new_originalPath, old_deviceAssetId, new_deviceAssetId, old_deviceId, new_deviceId, old_isExternal, new_isExternal, is_skipped, skip_reason, cp_command, mv_command
      ) VALUES (
        rec.asset_id, rec."originalPath", new_originalPath, rec."deviceAssetId", new_deviceAssetId, rec."deviceId", new_deviceId, rec."isExternal", new_isExternal, false, NULL, cp_cmd, mv_cmd
      );

    ELSE
      -- History: skipped asset
      INSERT INTO migrate_assets_external_to_internal_history (
        asset_id, old_originalPath, new_originalPath, old_deviceAssetId, new_deviceAssetId, old_deviceId, new_deviceId, old_isExternal, new_isExternal, is_skipped, skip_reason, cp_command, mv_command
      ) VALUES (
        rec.asset_id, rec."originalPath", NULL, rec."deviceAssetId", NULL, rec."deviceId", NULL, rec."isExternal", NULL, true, 'No matching import path prefix found', NULL, NULL
      );
 
    END IF;
  END LOOP;
END;
$$;
