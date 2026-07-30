#!/bin/sh

# Exhibit assumes Flatpak has provided an app-specific XDG data directory.
if [ -z "${XDG_DATA_HOME:-}" ]; then
  XDG_DATA_HOME="$HOME/.local/share/exhibit"
  export XDG_DATA_HOME
fi
mkdir -p "$XDG_DATA_HOME"

# Arch's F3D Python bindings need more static TLS than glibc reserves by
# default. Increasing the reserve avoids globally preloading jemalloc, which
# can make GLib abort during rendering.
case ":${GLIBC_TUNABLES:-}:" in
  *:glibc.rtld.optional_static_tls=*) ;;
  *)
    GLIBC_TUNABLES="glibc.rtld.optional_static_tls=4096${GLIBC_TUNABLES:+:$GLIBC_TUNABLES}"
    export GLIBC_TUNABLES
    ;;
esac

exec /usr/lib/exhibit/exhibit "$@"
