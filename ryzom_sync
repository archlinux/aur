#!/bin/sh

RYZOM_GAMEDATA_DIR='/usr/share/ryzom'
RYZOM_UPDATE_SERVER='www.ryzom.com::ryzom'
###############################

cd "$RYZOM_GAMEDATA_DIR"

if groups | grep -q games ; then 
  rsync -rtzvu --progress --stats --recursive --timeout=30 "$RYZOM_UPDATE_SERVER/data" ./ 
else 
  echo "you need to be in games group to do this"
  exit 1
fi
