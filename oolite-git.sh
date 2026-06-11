#!/bin/bash
export OO_EXEDIR=/usr/share/oolite-git/
export OO_DIRTYPE=legacy
export OO_ADDITIONALADDONSDIRS=$OO_EXEDIR/AddOns
exec /usr/share/oolite-git/run_oolite.sh "$@"


