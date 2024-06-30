#!/bin/bash

action=$1
version=$2
[ "$3" == "--overwrite" ]
overwrite=$?;


cd ~/.minecraft/ || { echo "Error: cannot access ~/.minecraft"; exit 1; }

if [ "$action" == "load" ]; then
    
    if $overwrite; then
      if ! [ -e ./modlib/.current ]; then
          echo "Warning: version file not found. Maybe you haven't saved at least once yet?
  If this is intended, use --overwrite to force operation" >&2
          exit 1
      elif ! diff -r ./mods/ ./modlib/"$(cat ./modlib/.current 2>/dev/null)"/ > /dev/null 2>&1; then
          echo "Warning: mismatch between last loaded/saved and current. Did you forgot to sync?
  If this is intended, use --overwrite to force operation" >&2
          exit 1
      fi
    fi

    if ! [ -d ./modlib/"$version" ]; then
        echo "Error: version $version not found"
        exit 1
    fi

    rm -rf ./mods/*
    cp -r ./modlib/"$version"/* ./mods/
    echo "$version" > ./modlib/.current

elif [ "$action" == "save" ] || [ "$action" == "sync" ]; then

    if [ "$version" == ".current" ]; then
        echo "Error: Illegal version name" >&2
        exit 1
    fi

    if [ "$action" == "save" ]; then
        if [ -d ./modlib/"$version" ] && $overwrite; then
            echo "Warning: $version is already present.
If this is intended, use --overwrite to force operation" >&2
            exit 1
        fi
        echo "$version" > ./modlib/.current
    elif [ "$action" == "sync" ]; then
        if ! [ -e ./modlib/.current ]; then
            echo "Error: version file not found. Maybe you haven't saved at least once yet?" >&2
            exit 1
        fi
        version=$(cat ./modlib/.current)
        if ! [ -d ./modlib/"$version" ]; then
            echo "Error: version file is pointing to a non-existance version ($version). Maybe it was deleted?
To reconstruct the save, run 'mcmods save $version'"
            exit 1
        fi
    fi

    rm -rf ./modlib/"$version"
    mkdir -p ./modlib/"$version"
    cp -r ./mods/* ./modlib/"$version"/

elif [ "$action" == "current" ]; then
    if [ -e ./modlib/.current ]; then
        
      echo $(cat ./modlib/.current), $(find "./mods" -type f | wc -l) mods
    else
        echo "Error: version file not found. Maybe you haven't saved at least once yet?" >&2
    fi

elif [ "$action" == "list" ]; then
    ls -1 ./modlib/ | paste -sd " "

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
    rm -rf ./modlib/"$version"

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
