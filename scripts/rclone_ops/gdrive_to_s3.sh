#!/usr/bin/env bash

source .env

FOLDER=${1:-$GDRIVE_TEST_FOLDER}
DEST_BUCKET=${2:-$AWS_BUCKET}
rclone copy ${GDRIVE_CONFIG}:${FOLDER} ${AWS_DEEP_CONFIG}:${DEST_BUCKET}