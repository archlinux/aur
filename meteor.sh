#!/bin/sh

if [ ! -d "$HOME"/.meteor ]; then
  cp -a /usr/share/meteor "$HOME"/.meteor
fi

"$HOME"/.meteor/meteor "$@"
