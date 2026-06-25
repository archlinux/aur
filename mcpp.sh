#!/bin/sh
# mcpp launcher (Arch / AUR mcpp-bin package).
#
# The AUR package installs mcpp's self-contained tree read-only under
# /opt/mcpp (shared by every user). But mcpp WRITES its registry sandbox,
# BMI/metadata caches, logs and downloaded toolchains into MCPP_HOME at
# runtime — that has to be a per-user, writable location, never /opt.
#
# mcpp resolves MCPP_HOME from the binary's real path (/proc/self/exe, which
# resolves symlinks), so a plain /usr/bin symlink would make MCPP_HOME land in
# the root-owned /opt tree and every command would fail to write. This wrapper
# fixes that by pinning the two env knobs the binary honors:
#
#   MCPP_HOME            — per-user home (default ~/.mcpp, same as install.sh)
#   MCPP_VENDORED_XLINGS — the bundled xlings under /opt, which mcpp copies
#                          into $MCPP_HOME/registry/bin/xlings on first run
#
# Both respect a value the user already exported, so power users can still
# point mcpp at a custom home or xlings.
set -eu

MCPP_OPT="/opt/mcpp"

export MCPP_HOME="${MCPP_HOME:-$HOME/.mcpp}"
export MCPP_VENDORED_XLINGS="${MCPP_VENDORED_XLINGS:-$MCPP_OPT/registry/bin/xlings}"

exec "$MCPP_OPT/bin/mcpp" "$@"
