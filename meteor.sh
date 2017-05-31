#!/bin/bash

if [ ! -d "$HOME/.meteor" ]; then
  install -d "$HOME/.meteor"
  cp -R /usr/share/meteor/* "$HOME/.meteor/"
fi

$HOME/.meteor/meteor "$@"
