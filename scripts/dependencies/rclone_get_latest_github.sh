#!/usr/bin/env bash

echo "NOTE: rclone a9c49c5 (06/02/2022) requires at least Go 1.18. Install it using ./go_get_latest.sh"

read -p "DEPRECATION: use ./rclone_get_latest.sh instead. That version uses \`go get\`. This script should only be used as a fall-back. [Enter: continue; Ctrl-c: exit]" dummy
GIT_DIR="rclone"
GIT_ORIGIN="https://github.com/rclone/rclone.git"
GIT_BRANCH="master"
if [ ! -d $GIT_DIR ]; then
  git clone $GIT_ORIGIN $GIT_DIR
fi
cd $GIT_DIR
git checkout $GIT_BRANCH
# Get latest updates
git pull

# Based on instructions at https://rclone.org/install/#install-from-source

# Skip `module load go` because at the time, go version too low to compile rclone
go build

if ! ./rclone version; then
  echo "Unable to \`go build\` to rclone"
  exit 1
fi

echo "rclone installed in $PWD/rclone. The next steps put rclone into binary directory"

read -p "Enter rclone binary directory [$HOME/.local/bin]" BIN_DIR
BIN_DIR=${BIN_DIR:-$HOME/.local/bin}
# attempt to create the directory if not exist yet
mkdir -p $BIN_DIR

cp ./rclone $BIN_DIR/
  
