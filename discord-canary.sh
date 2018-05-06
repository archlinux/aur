#!/bin/bash
# Discord Updater Script

#DL_URL="https://discordapp.com/api/download?platform=linux&format=tar.gz"
DL_URL="https://discordapp.com/api/download/canary?platform=linux&format=tar.gz"

#EDITION="Discord"
EDITION="DiscordCanary"

START_DIR="$PWD"
INSTALL_DIR="$HOME/.local/share/$EDITION/"

is_running() {
  pidof "$EDITION" 2> /dev/null > /dev/null
}

get_latest_version() {
  curl -sI "$DL_URL" | grep location | sed -E 's/^.*\/([0-9.]+)\/.*$/\1/'
}

should_update() {
  version="$(get_latest_version)"
  test ! "x$(test -f .version && cat .version)" = "x$version"
}

update() {
  test -f .version && rm .version
  echo "Updating to version $version"
  test -d "$EDITION" && rm -rv "$EDITION"
  curl -L "$DL_URL" | tar xvzf -
  echo "$version" > .version
}

set -e

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

if [ "x$1" = 'x-u' ]; then
  should_update || true
  update
  exit $?
fi

if ! is_running && should_update; then
  cd "$START_DIR"
  xterm -e "$0 -u"
  cd "$INSTALL_DIR"
fi

cd "$EDITION"
PULSE_LATENCY_MSEC=30 ./"$EDITION" "${@}"
