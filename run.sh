#!/bin/sh -e
mkdir -p ~/.slime-forest/playerdata/playerdata
cd ~/.slime-forest

for realf in /usr/share/slime-forest-demo/{exec.ver,images,maps,*.wad} ; do
  linkf=$(basename "$realf")
  test -e "$linkf" || ln -s "$realf" "$linkf"
done
test -e playerdata/data.ver || cp exec.ver playerdata/data.ver

nohup /usr/share/slime-forest-demo/jquest64 \
  < /dev/null > /dev/null 2> /dev/null
