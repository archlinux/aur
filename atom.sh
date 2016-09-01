#!/bin/bash

while getopts ":wtfvh-:" opt; do
  case "$opt" in
    -)
      case "${OPTARG}" in
        wait)
          WAIT=1
          ;;
        help|version)
          REDIRECT_STDERR=1
          EXPECT_OUTPUT=1
          ;;
        foreground|test)
          EXPECT_OUTPUT=1
          ;;
      esac
      ;;
    w)
      WAIT=1
      ;;
    h|v)
      REDIRECT_STDERR=1
      EXPECT_OUTPUT=1
      ;;
    f|t)
      EXPECT_OUTPUT=1
      ;;
  esac
done

if [ $REDIRECT_STDERR ]; then
  exec 2> /dev/null
fi

if [ $EXPECT_OUTPUT ]; then
  export ELECTRON_ENABLE_LOGGING=1
fi

ATOM_PATH="/usr/bin/electron --app=/usr/lib/atom-bleeding"

ATOM_HOME="${ATOM_HOME:-$HOME/.atom}"
mkdir -p "$ATOM_HOME"

if [ $EXPECT_OUTPUT ]; then
  $ATOM_PATH --executed-from="$(pwd)" --pid=$$ "$@"
  exit $?
else
  (
  nohup $ATOM_PATH --executed-from="$(pwd)" --pid=$$ "$@" > "$ATOM_HOME/nohup.out" 2>&1
  if [ $? -ne 0 ]; then
    cat "$ATOM_HOME/nohup.out"
    exit $?
  fi
  ) &
fi

# Exits this process when Atom is used as $EDITOR
on_die() {
  exit 0
}
trap 'on_die' SIGQUIT SIGTERM

# If the wait flag is set, don't exit this process until Atom tells it to.
if [ $WAIT ]; then
  while true; do
    sleep 1
  done
fi
