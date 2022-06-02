#!/usr/bin/env bash
go get github.com/rclone/rclone
_INSTALLED_BIN=$(go env GOPATH)/bin/rclone

echo "Checking installation"
if ! $_INSTALLED_BIN version; then
  echo "rclone not reachable at $_INSTALLED_BIN"
  exit 1
fi
read -p "Enter desired binary directory [$HOME/.local/bin]: " BIN_DIR
BIN_DIR=${BIN_DIR:-$HOME/.local/bin}

cp $_INSTALLED_BIN $BIN_DIR

echo "Checking if rclone reachable from \$PATH"
if ! rclone version; then
  echo "rclone not in \$PATH"
fi

echo "Installation success!"
