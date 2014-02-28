#!/bin/sh

echo "OpenTitus 0.8.0 launcher"

mkdir -p ~/.opentitus

# titus config + music
if [ ! -f ~/.opentitus/titus.conf ]; then
  cp /usr/share/opentitus/titus.conf ~/.opentitus
fi
if [ ! -f ~/.opentitus/titus/music_ttf.bin ]; then
  mkdir -p ~/.opentitus/titus
  cp /usr/share/opentitus/music_ttf.bin ~/.opentitus/titus
fi

# moktar config + music
if [ ! -f ~/.opentitus/titus_moktar.conf ]; then
  cp /usr/share/opentitus/titus_moktar.conf ~/.opentitus
fi
if [ ! -f ~/.opentitus/moktar/music_mok.bin ]; then
  mkdir -p ~/.opentitus/moktar
  cp /usr/share/opentitus/music_mok.bin ~/.opentitus/moktar
fi

# run the game
cd ~/.opentitus && exec /usr/lib/opentitus/opentitus "$@"
