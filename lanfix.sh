#!/bin/bash

fatal() {
    echo "$@"
    echo "Aborting."
    exit 1
}

echo "This script will use a utility to randomise your game's serial number, with the "
echo "intent of allowing LAN multiplayer to operate with more than 2 players."
echo "CAUTION: This procedure involves downloading a program released by Razor 1911, a"
echo "software cracking group."
read -p "Proceed? [y/N] " -r
[[ $REPLY =~ ^[Yy]$ ]] || fatal
echo "Proceeding."

usrdir="$HOME/.tiberiansun"
prefixdir="$usrdir/tiberiansun"
gamedir="$prefixdir/drive_c/Program Files/EA Games/Command & Conquer The First Decade/Command & Conquer(tm) Tiberian Sun(tm)/SUN"

export WINEARCH='win32'
export WINEPREFIX="$prefixdir"

cd gamedir || fatal "Could not cd into game dir at '$gamedir'."
mkdir -p lanfix || fatal "Could not make subdir in game dir."
cd lanfix || fatal "Could not cd into new subdir in game dir."

utilurl='http://gf.wiretarget.com/ti/rzrtsfix.zip'
if ! [ -f rzrtsfix.zip ]
then
    curl -O "$utilurl" --referer http://gf.wiretarget.com/tiberian_sun.htm --user-agent Mozilla/4.0
    [ "$?" -eq 0 ] || fatal "Could not download utility from '$utilurl'."
fi

unzip rzrtsfix.zip || fatal "Could not unzip utility zip."

cd .. || fatal "Could not cd back to game dir."
wine lanfix/REGSETUP.EXE || fatal "wine exited abnormally, code $?"

echo "Complete."

# TODO LAN UDP Fix (Excludes internet play)

zipurl=$(curl -sL 'http://games.softpedia.com/dyn-postdownload.php?p=55923&t=4&i=1' --referer 'http://games.softpedia.com/progDownload/Command-Conquer-Tiberian-Sun-LAN-Patch-Download-55923.html' --user-agent Mozilla/5.0 | grep -m1 'click here' | sed -r -e 's,^.*If it doesn'"'"'t\, please <a href="(http://[0-9a-zA-Z-]+.softpedia.com/dl/[0-9a-z]+/[0-9a-z]+/[0-9]+/games/patch/ts_ra2_lanpatch_1_00.zip)".*$,\1,;tx;d;:x')

curl -L -o udppatch.zip "$zipurl" --referer 'http://games.softpedia.com/dyn-postdownload.php?p=55923&t=4&i=1' --user-agent Mozilla/5.0
