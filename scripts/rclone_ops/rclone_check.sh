#!/usr/bin/env bash
# Showcase rclone check command

source .env
TEST_FOLDER=${1:-$GDRIVE_TEST_FOLDER}
TEST_LOCAL=${2:-$TEST_LOCAL}
TEST_BUCKET=${3:-$AWS_BUCKET}


GDRIVE_REMOTE=${GDRIVE_CONFIG}:${TEST_FOLDER}
AWS_REMOTE=${AWS_DEEP_CONFIG}:${TEST_BUCKET}

echo "gdrive: $GDRIVE_REMOTE; aws: $AWS_REMOTE; local: $TEST_LOCAL"
read -p "Enter: continue; Ctrl+C: abort" _DUMMY_

## First, we will show that the check command will say
## no difference if the directories are well-synced.

### copy entirely from google drive to local and aws bucket
echo "copying: gdrive -> local $TEST_LOCAL"
rclone copy ${GDRIVE_REMOTE} ${TEST_LOCAL}
ls ${TEST_LOCAL}
echo "copying: gdrive -> aws $AWS_REMOTE"
rclone copy ${GDRIVE_REMOTE} ${AWS_REMOTE}


### check the directory hiearchy difference
rclone check ${GDRIVE_REMOTE} ${TEST_LOCAL} --missing-on-dst >gdrive_local_dest.txt &
rclone check ${GDRIVE_REMOTE} ${TEST_LOCAL} --missing-on-src >gdrive_local_src.txt &
rclone check ${GDRIVE_REMOTE} ${AWS_REMOTE} --missing-on-dst >gdrive_aws_dest.txt &
rclone check ${GDRIVE_REMOTE} ${AWS_REMOTE} --missing-on-src >gdrive_aws_src.txt &

wait # wait for the tasks to be done before continuing



## Clean up (be very careful with delete statements)
# rclone delete ${TEST_LOCAL}
# rclone delete ${AWS_REMOTE}