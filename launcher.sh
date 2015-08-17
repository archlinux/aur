#!/bin/bash

if [[ "$0" =~ / ]]; then
  read app_path < <(realpath -- "$0")
else
  if hash "$0" &> /dev/null; then
    read app_path < <(hash -t "$0")
  else
    if [ -f "./$0" ]; then
      read app_path < <(realpath -- "./$0")
    fi
  fi
fi

if [ -z "$app_path" ]; then
  app_path=/usr/bin
else
  read app_path < <(dirname -- "$app_path")
fi

app_path+="/../lib/daydreamer/"

if [ -n "$1" ] && [ -f "$1" ]; then
  read game_file_path < <(realpath "$1")
fi

launch_app() {
  if [ -n "$1" ]; then
    if [ -f "$app_path/$1" ]; then
      if [ -n "$game_file_path" ]; then
        exec -- java -jar "$app_path/$1" "$game_file_path"
      else
        exec -- java -jar "$app_path/$1"
      fi
    else
      printf -- "„%s”: file not found" "$app_path/$1" >&2
      exit 1
    fi
    exit 255
  fi
}

