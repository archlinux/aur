#!/bin/sh

if [ -n "$FASTQC_JAVA" ]; then
  javaenv="$FASTQC_JAVA"
else
  default_java="$(archlinux-java get)"
  if [ "$(echo "$default_java" | cut -d - -f 2)" -ge 11 ]; then
    javaenv="$default_java"
  else
    # use latest available java
    javaenv="$(archlinux-java status | tail -n +2 | cut -d ' ' -f 3 | sort -nk 2 -t - | tail -n 1)"
  fi
fi

PATH="/usr/lib/jvm/$javaenv/bin:$PATH" exec /usr/share/fastqc/fastqc "$@"
