#!/usr/bin/env bash

# Lists the files existing in a folder on Google Drive

source .env
FOLDER=${1:-$GDRIVE_TEST_FOLDER}
echo "folder: $FOLDER"
rclone --max-depth 2 ls ${GDRIVE_CONFIG}:${FOLDER}
