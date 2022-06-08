#!/usr/bin/env bash

source .env
FOLDER=${1:-$GDRIVE_TEST_FOLDER}
rclone --max-depth 2 ls ${GDRIVE_CONFIG}:${FOLDER}