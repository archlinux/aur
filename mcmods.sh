#!/bin/bash

action=$1
version=$2

cd ~/.minecraft/ || exit

if [ "$action" == "load" ]; then

    if ! [ -e ./mods/.current ] && [ "$3" != "--overwrite" ]; then
        echo "Warning: version file not found. Maybe you haven't saved at least once yet?
If this is intended, use --overwrite to force operation" >&2
        exit 1
    elif ! diff -r --exclude=".current" ./mods/ ./modlib/"$(cat ./mods/.current)"/ > /dev/null 2>&1 && [ "$3" != "--overwrite" ]; then
        echo "Warning: mismatch between last loaded/saved and current. Did you forget to sync?
If this is intended, use --overwrite to force operation" >&2
        exit 1
    fi

    echo "$version" > ~/.minecraft/mods/.current
    rm -rf ./mods/
    mkdir ./mods/
    cp -r ./modlib/"$version"/* ./mods/

elif [ "$action" == "save" ] || [ "$action" == "sync" ]; then

    if [ "$action" == "save" ]; then
        if [ -d ~/.minecraft/modlib/"$version" ] && [ "$3" != "--overwrite" ]; then
            echo "Warning: $version is already present.
If this is intended, use --overwrite to force operation" >&2
            exit 1
        fi
        echo "$version" > ./mods/.current
    elif [ "$action" == "sync" ]; then
        if ! [ -e ./mods/.current ]; then
            echo "Error: version file not found. Maybe you haven't saved at least once yet?" >&2
            exit 1
        fi
        version=$(cat ./mods/.current)
    fi

    rm -rf ./modlib/"$version"
    mkdir -p ./modlib/"$version"
    cp -r ./mods/* ./modlib/"$version"/
    rm -f ./modlib/"$version"/.current

elif [ "$action" == "current" ]; then
    if [ -e ./mods/.current ]; then
        
      echo $(cat ./mods/.current), $(find "./mods" -type f | wc -l) mods
    else
        echo "Error: version file not found. Maybe you haven't saved at least once yet?" >&2
    fi

elif [ "$action" == "list" ]; then
    ls -1 ~/.minecraft/modlib/ | paste -sd " "

elif [ "$action" == "delete" ]; then
    if ! [ -d "./modlib/$version" ]; then
        echo "Error: version '$version' not found" >&2
        exit 1
    fi

    # confirm deletion before deleting
    echo "Are you sure you want to delete '$version' containing $(find "./modlib/$version" -type f | wc -l) mods? [y/N]"
    read -r confirm
    if ! [ "$confirm" == "y" ] && ! [ "$confirm" == "Y" ]; then
        exit 0
    fi
    rm -rf ~/.minecraft/modlib/"$version"

elif [ "$action" == "help" ]; then
    echo "Usage: mcmods <action> {parameter} [flag]
Possible actions:
  load <version>:           Load a saved version
  save <version>:           Save current as a version
  delete <version>:         Delete a saved version
  sync:                     Synchronize last loaded/saved version with current
  list:                     List all saved versions
  current:                  Check which version is current
  help:                     Print out help message
Possible flags:
  --overwrite:              Risk losing data and allow overwrite"

else
    echo "Error: action '$action' was not understood, try 'mcmods help'" >&2
    exit 1
fi
