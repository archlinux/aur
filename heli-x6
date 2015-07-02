#!/bin/sh
unset WINEPREFIX
if [ ! -d "$HOME"/.heli-x6 ] ; then
   echo "Notice: Copying heli-x6 into ~/.heli-x6. To uninstall completely, don't forget to remove ~/.heli-x6."
   mkdir "$HOME"/.heli-x6
   rsync -av /usr/share/heli-x6/* "$HOME"/.heli-x6
fi
"$HOME"/.heli-x6/runHELI-X.sh
