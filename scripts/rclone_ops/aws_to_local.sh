#!/usr/bin/env bash

# AWS back to local
source .env
rclone copy AWS:$AWS_BUCKET $SRC_DIR/dest/hello-world.txt

cat $SRC_DIR/dest/hello-world.txt