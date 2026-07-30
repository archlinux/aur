#!/bin/sh

if [ -z "${XDG_DATA_HOME:-}" ]; then
  XDG_DATA_HOME="$HOME/.local/share/exhibit"
  export XDG_DATA_HOME
fi
mkdir -p "$XDG_DATA_HOME"

case ":${GLIBC_TUNABLES:-}:" in
  *:glibc.rtld.optional_static_tls=*) ;;
  *)
    GLIBC_TUNABLES="glibc.rtld.optional_static_tls=4096${GLIBC_TUNABLES:+:$GLIBC_TUNABLES}"
    export GLIBC_TUNABLES
    ;;
esac

exec /usr/lib/exhibit/exhibit "$@"
