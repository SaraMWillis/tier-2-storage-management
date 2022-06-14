#!/usr/bin/env bash
# Showcase rclone check command

source .env

FLAGGED_RCLONE=${FLAGGED_RCLONE:-"rclone"}

TEST_FOLDER=${1:-$TEST_FOLDER}

LOCAL_ROOT=${2:-$LOCAL_ROOT}
GDRIVE_ROOT=${3:-$GDRIVE_ROOT}
AWS_ROOT=${4:-$AWS_ROOT}
AWS_BUCKET=${5:-$AWS_BUCKET}


GDRIVE_REMOTE=${GDRIVE_CONFIG}:${GDRIVE_ROOT}
AWS_REMOTE=${AWS_DEEP_CONFIG}:${AWS_BUCKET}/${AWS_ROOT}


echo "gdrive: $GDRIVE_REMOTE; aws: $AWS_REMOTE; local: $LOCAL_ROOT"
echo "test folder: $TEST_FOLDER"
read -p "Enter: continue; Ctrl+C: abort" _DUMMY_

## First, we will show that the check command will say
## no difference if the directories are well-synced.

### copy entirely from google drive to local and aws bucket
echo "copying: gdrive -> local $LOCAL_ROOT:"
rclone --dry-run copy ${GDRIVE_REMOTE}/$TEST_FOLDER ${LOCAL_ROOT}
read -p "Copy? y/n> " do_copy
if [ "$do_copy" == "y" ]; then
    rclone copy ${GDRIVE_REMOTE}/$TEST_FOLDER $LOCAL_ROOT
fi

rclone ls ${LOCAL_ROOT}
echo "copying: gdrive -> aws $AWS_REMOTE"
rclone copy ${GDRIVE_REMOTE}/$TEST_FOLDER ${AWS_REMOTE}
rclone ls $AWS_REMOTE


### check the directory hiearchy difference
rclone check ${GDRIVE_REMOTE}/$TEST_FOLDER ${LOCAL_ROOT} --missing-on-dst gdrive_local_dest.txt &
rclone check ${GDRIVE_REMOTE}/$TEST_FOLDER ${LOCAL_ROOT} --missing-on-src gdrive_local_src.txt &
# NOTE: there are some nitpicky details regarding bucket storage providers
# there is no file hierarchy, so we have to use filters this may create
# some conflicts with hierarchiral reordering
# like comparing aws:bucket/some/root/ versus gdrive:/some/different/root/
# such as in this case.

# Generally, it is best practice to put in a different bucket for each different root:
# aws:some_different_root versus gdrive:/some/different/root
# Comparing against each other is now a much easier task.

## BAD
rclone check ${GDRIVE_REMOTE}/$TEST_FOLDER ${AWS_REMOTE} --missing-on-dst gdrive_aws_dest.txt &

## BAD
rclone check ${GDRIVE_REMOTE}/$TEST_FOLDER ${AWS_REMOTE} --missing-on-src gdrive_aws_src.txt &

echo "Waiting for tasks to be done"
wait # wait for the tasks to be done before continuing
echo "Tasks done"

