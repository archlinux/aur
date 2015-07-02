#!/bin/bash
# ARCHLINUX_QSP_LAUNCHER v0.2 (c) 3ED @ terms of GPL3
# License: /usr/share/licenses/common/GPL3

# get original bin dir from "any location"
get_QSP_BIN_PATH() {
  local bin="$1" path="$2"

  if [[ "$0" =~ / ]]; then
    read QSP_BIN_PATH < <(realpath -- "$0")
  else
    if hash "$0" &> /dev/null; then
      read QSP_BIN_PATH < <(hash -t "$0")
    else
      if [ -f "./$0" ]; then
        read QSP_BIN_PATH < <(realpath -- "./$0")
      fi
    fi
  fi

  if [ -z "$QSP_BIN_PATH" ]; then
    QSP_BIN_PATH=/usr/bin
  else
    read QSP_BIN_PATH < <(dirname -- "$QSP_BIN_PATH")
  fi

  if [ -n "$path" ]; then
    QSP_BIN_PATH+="$path"
  fi

  test -f "$QSP_BIN_PATH/$bin"
}

# convert all paths by realpath
qet_QSP_ARGV() {
  local i double_minus from_realpath

  for i in "$@"; do
    if [ -z "$double_minus"]; then
      from_realpath=
      case "$i" in
        "--") double_minus=yes; QSP_ARGV+=("$i");;
        "-"*) QSP_ARGV+=("$i");;
        "") continue;;
        *) read from_realpath < <(realpath -- "$i"); QSP_ARGV+=("$from_realpath");;
      esac
    else
      read from_realpath < <(realpath -- "$i"); QSP_ARGV+=("$from_realpath")
    fi
  done

  test "${#QSP_ARGV[@]}" -gt "0"
}

# launch qsp...
qsp_launch() {
  local QSP_BIN=qsp-gui

  get_QSP_BIN_PATH "$QSP_BIN" "/../lib/qsp/" || exit 127

  if qet_QSP_ARGV "$@"; then
    cd "$QSP_BIN_PATH"
    exec -- ./"$QSP_BIN" "${QSP_ARGV[@]}"
  else
    cd "$QSP_BIN_PATH"
    exec -- ./"$QSP_BIN"
  fi
}

qsp_launch "$@"
