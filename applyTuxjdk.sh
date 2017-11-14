#!/bin/bash

QUILT="$( which quilt 2>/dev/null )"
if [[ -z $QUILT ]] ; then
  echo 'quilt not found' >&2
  exit 1
fi

sourceSetupEnv() {
  local SCRIPT_SOURCE
  local SCRIPT_DIR
  ## resolve folder of this script, following all symlinks,
  ## http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
  SCRIPT_SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SCRIPT_SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    SCRIPT_DIR="$( cd -P "$( dirname "$SCRIPT_SOURCE" )" && pwd )"
    SCRIPT_SOURCE="$(readlink "$SCRIPT_SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SCRIPT_SOURCE != /* ]] && SCRIPT_SOURCE="$SCRIPT_DIR/$SCRIPT_SOURCE"
  done
  SCRIPT_DIR="$( cd -P "$( dirname "$SCRIPT_SOURCE" )" && pwd )"

  source "$SCRIPT_DIR/setupQuiltEnv.sh"
}

sourceSetupEnv

echo "Applying quilt patches on current folder..."
"$QUILT" push -a

readonly result=$?
if [ "$result" = 0 ] || [ "$result" = 2 ]
then
  echo ''
  echo 'Quilt patches applied.'
else
  echo ''
  echo -e '\e[91mQuilt patches application failed\e[0m'
  exit 1
fi
