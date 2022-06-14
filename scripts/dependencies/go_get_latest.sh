#!/usr/bin/env bash

# Gets a new version of go
# this is particularly useful if we're updating to higher version of rclone.

if ! git clone https://go.googlesource.com/go go-latest 1>/dev/null 2>/dev/null
then
  echo "ERROR: Unable to fetch go source at https://go.googlesource.com/go"
  exit 1
fi

cd go-latest
# install Go
cd src
# Making Go requires a bootstrapping version of Go
module load go # This loads 1.15.2 as of 06/02/2022
./make.bash
module unload go
read -p "Enter installation binary directory [$HOME/.local/bin]: " BIN_DIR
BIN_DIR=${BIN_DIR:-$HOME/.local/bin}
# Attempts to create the directory if not yet existed
mkdir -p $BIN_DIR
cp -r ../bin/* $BIN_DIR

# test for Go installation
echo 'package main
import "fmt"
func main() {
	fmt.Printf("Hello world\n")
}
' > hello.go

go run hello.go
rm hello.go

echo "go version: $(go version)"
