#!/usr/bin/env bash

#taken from https://bbs.archlinux.org/viewtopic.php?id=131666 by falconindy
awk -v newsums="$(makepkg -g)" '
BEGIN {
  if (!newsums) exit 1
}

/^[[:blank:]]*(md|sha)[[:digit:]]+sums=/,/\)[[:blank:]]*$/ {
  if (!i) print newsums; i++
  next
}

1
' PKGBUILD > PKGBUILD.new && mv PKGBUILD{.new,}