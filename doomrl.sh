#!/bin/bash
dir="${XDG_DATA_HOME:-$HOME/.local/share}/doomrl"
bin=/usr/share/doomrl

if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir" || exit 1

    cp $bin/log.txt "$dir" || :
    cp $bin/error.log "$dir" || :
    cp $bin/{core,doomrl,player,score}.wad "$dir" || :
    cp $bin/{colors,config,keybindings,musichq,soundhq}.lua "$dir" || exit 1
    cp $bin/doom.prc "$dir" || :
    cp -r $bin/backup "$dir" || exit 1
    cp -r $bin/modules "$dir" || exit 1
    cp -r $bin/mortem "$dir" || exit 1
    cp -r $bin/screenshot "$dir" || exit 1

    ln -s $bin/doomrl "$dir" || exit 1
    ln -s $bin/doomrl_{gnome-terminal,konsole,xterm} "$dir" || exit 1
    ln -s $bin/{manual,unix_notes,version_api,version}.txt "$dir" || exit 1
    ln -s $bin/mp3 "$dir" || exit 1
    ln -s $bin/wavhq "$dir" || exit 1 
fi

cd "$dir"
exec $bin/doomrl $1
