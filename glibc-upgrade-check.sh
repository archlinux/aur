#!/usr/bin/env bash
set -euo pipefail

# Warn when the host glibc has moved past the uninative tarball's.
#
# Run from a pacman PostTransaction hook on glibc upgrades, not from the
# package's own .install - an .install fires when THIS package changes, and
# the event that matters is the OTHER package changing.
#
# Why it matters: the fragment pins UNINATIVE_MAXGLIBCVERSION to the glibc this
# tarball was built from. uninative.bbclass compares that against the host's
# `ldd --version` and, when the host is newer, raises a RuntimeError that its
# own handler downgrades to a bb.warn and disables uninative for the rest of
# the build. sstate is not corrupted - that check exists precisely to prevent
# it - but NATIVELSBSTRING silently stops being "universal", so the artefacts
# stop being shareable and nothing says so outside one line in a long log.
#
# Only MAJOR.MINOR matters: the fragment carries ${pkgver%%+*}, and the bbclass
# parses the last whitespace-separated token of `ldd --version`. An Arch glibc
# rebuild (+r3 -> +r5) changes neither, so this stays quiet through those and
# speaks up only on a real 2.44 -> 2.45 style bump, roughly twice a year.

fragment=/usr/share/yocto-uninative/uninative.inc

# The package could have been removed while the hook file lingered, or an
# upgrade could be mid-flight. Nothing to say in either case.
[[ -r $fragment ]] || exit 0

pinned=$(grep -Po '^UNINATIVE_MAXGLIBCVERSION:forcevariable = "\K[^"]+' "$fragment" || true)
[[ -n $pinned ]] || exit 0

# Read the version out of libc itself rather than asking pacman: this runs
# inside a pacman transaction, and libc.so.6 is executable and authoritative
# for the glibc that was just installed.
host=$(/usr/lib/libc.so.6 --version 2>/dev/null | head -1 |
  grep -Po '\d+\.\d+(?=\.?\s*$)' || true)
[[ -n $host ]] || exit 0

[[ $host == "$pinned" ]] && exit 0

cat >&2 <<EOF
==> yocto-uninative-tarball: host glibc is now $host, tarball provides $pinned.

    BitBake will disable uninative on the next build (a bb.warn, easily missed)
    and native/cross artefacts will stop being shareable across hosts.

    Rebuild and reinstall the package to catch up:
        cd <aur-packages>/packages/yocto-uninative-tarball && makepkg -si
EOF
exit 0
