#!/usr/bin/env bash

# taken from guide at https://github.com/SaraMWillis/tier-2-storage-management/blob/main/aws/aws-cli/install-and-configure.md
if [ ! unzip ]; then
  echo "Installation on HPC: This action requires an interactive node or a storage node because unzip not available on login shell"
  exit 1
fi

if [ ! -f awscliv2.zip ]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
fi
unzip -u awscliv2.zip

cd aws
read -p "Enter install directory (not executable) [$HOME/.local]: " INSTALL_DIR
read -p "Enter binary directory (to be executed from) [$HOME/.local/bin]" BIN_DIR

INSTALL_DIR=${INSTALL_DIR:-$HOME/.local}
BIN_DIR=${BIN_DIR:-$HOME/.local/bin}
echo "Installing to $INSTALL_DIR; placing execs in $BIN_DIR"
./install --install-dir $INSTALL_DIR --bin-dir $BIN_DIR

echo "Testing installation:"
$BIN_DIR/aws --version
if ! $BIN_DIR/aws --version >/dev/null ; then
  echo "Cannot perform $BIN_DIR/aws --version"
  exit 1
fi

if  ! aws --version >/dev/null ; then
  echo "note: aws not in \$PATH"
fi

echo "Installation success!"
