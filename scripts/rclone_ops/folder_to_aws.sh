#!/usr/bin/env bash

source .env

FLAGGED_RCLONE=${FLAGGED_RCLONE:-rclone}
echo "Deleting existing files"
$FLAGGED_RCLONE purge ${AWS_DEEP_CONFIG}:${AWS_BUCKET}
echo "local to deep"
$FLAGGED_RCLONE copy $SRC_DIR/unique_name_generator ${AWS_DEEP_CONFIG}:${AWS_BUCKET}/hungtr/as/many/folders/as/wanted/
echo "restoring"
$FLAGGED_RCLONE backend restore ${AWS_DEEP_CONFIG}:${AWS_BUCKET}/hungtr/as/many/folders/as/wanted/ -o lifetime=5 -o priority=Standard
echo "deep to local"
$FLAGGED_RCLONE copy ${AWS_DEEP_CONFIG}:${AWS_BUCKET}/hungtr/as/many/folders/as/wanted/ $LOCAL_ROOT/