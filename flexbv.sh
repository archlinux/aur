#!/bin/sh
file=$(realpath "$@")
mkdir -p $HOME/.config/FlexBV/
cd $HOME/.config/FlexBV/
/opt/flexbv/flexbv "$file"
