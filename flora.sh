#!/bin/bash

CONF_DIR="$HOME/.config/FLORA"

mkdir -p ${CONF_DIR}

# if args contains -c then don't append default conf path
if [[ " ${@} " =~ " -c " ]]; then
  /usr/lib/flora/FLORA ${@}
else
  /usr/lib/flora/FLORA -c ${CONF_DIR} ${@}
fi
