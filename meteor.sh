#!/bin/bash

if [ ! -d "$HOME"/.meteor ]; then
  mkdir "$HOME"/.meteor
  cp -r /usr/share/meteor/* "$HOME"/.meteor
fi

"$HOME"/.meteor/meteor "$@"
