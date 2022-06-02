#!/usr/bin/env bash
# Copies a file to aws

source .env # adds the env vars to this run 
rclone copy $SRC_DIR/hello-world.txt AWS:$AWS_BUCKET
# see the operation's result
aws s3api head-object --bucket $AWS_BUCKET --key hello-world.txt --output=json