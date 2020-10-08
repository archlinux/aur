#!/usr/bin/env sh

curl -sL "https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance" |\
    grep -Po '\"Version\":\"20.*?\"' |\
    sed -r -e 's/^.*\":\"//' \
    -e 's/\"$//'
