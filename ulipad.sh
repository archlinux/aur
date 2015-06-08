#!/bin/bash

ULI_HOME=~/.ulipad
ULI_ROOT=/usr/share/ulipad
ULI_LINK=(UliPad.pyw acp contrib doc images mixins modules
           packages resources scripts tools ulipad.ico wizard)
ULI_VERS=4.1

create_local() {
  rm -rf "$ULI_HOME"
  install -dm755 "$ULI_HOME"

  for link in ${ULI_LINK[@]}; do ln -sf $ULI_ROOT/$link "$ULI_HOME"; done
  cp -r $ULI_ROOT/{UliPad.py,conf,lang,plugins} $ULI_HOME

  find "$ULI_HOME" -type d -exec chmod 755 '{}' \;
  find "$ULI_HOME" -type f -exec chmod 644 '{}' \;

  touch "$ULI_HOME"/.$ULI_VERS
}

[[ ! -e $ULI_HOME/.$ULI_VERS ]] && create_local
cd "$ULI_HOME"
python2 UliPad.py "$@" 2> "$ULI_HOME"/error.txt
exit $?
