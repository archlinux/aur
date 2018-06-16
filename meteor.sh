#!/bin/bash

if [ ! -d "$HOME/.meteor" ]; then
  install -d "$HOME/.meteor"
  cp -r /usr/share/meteor/* "$HOME/.meteor/"
fi

"$HOME/.meteor/meteor" "$@"
