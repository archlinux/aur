#!/bin/sh

# Set Go path
export GOPATH=~/go
# Set Go binary path
export GOBIN=$GOPATH/bin
# Proceed to installation
go install
# Copy the binary
sudo cp $GOPATH/bin/god /usr/local/bin/
