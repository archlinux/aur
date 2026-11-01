#!/bin/sh

#basedir="$(dirname "$0")"
# If this script is being run through a symlink, we need to know where
# in the filesystem the script itself is, not where the symlink is.
myname="$0"
if [ -L "$myname" ]; then
  # XXX readlink is not POSIX, but is present in GNU coreutils
  # and on FreeBSD.  Unfortunately, the -f option (which follows
  # a whole chain of symlinks until it reaches a non-symlink
  # path name) is a GNUism, so we have to have a fallback for
  # FreeBSD.  Fortunately, FreeBSD has realpath instead;
  # unfortunately, that's also non-POSIX and is not present in
  # GNU coreutils.
  #
  # If this launcher were a C program, we could just use the
  # realpath function, which *is* POSIX.  Too bad POSIX didn't
  # make that function accessible to shell scripts.

  # If realpath is available, use it; it Does The Right Thing.
  possibly_my_real_name="`realpath "$myname" 2>/dev/null`"
  if [ "$?" -eq 0 ]; then
    myname="$possibly_my_real_name"
  else
    # realpath is not available; hopefully readlink -f works.
    myname="`readlink -f "$myname" 2>/dev/null`"
    if [ "$?" -ne 0 ]; then
      # Ugh.
      complain "cannot be run using a symlink on this operating system."
    fi
  fi
fi
basedir="$(dirname "$myname")"

getCacheDir() {
  local cdir
  if [ ! -z "${XDG_CACHE_HOME}" ]; then
    cdir="${XDG_CACHE_HOME}"
  elif [ -e "${HOME}/.cache" ]; then
    cdir="${HOME}/.cache"
  elif [ -e "${HOME}/.local/cache" ]; then
    cdir="${HOME}/.local/cache"
  elif [ -d "${HOME}/tmp" ]; then
    cdir="${HOME}/tmp"
  fi
  if [ ! -z "${cdir}" ]; then
    mkdir -p "${cdir}/konform" && cdir="${cdir}/konform"
  fi
  echo "${cdir}"
}

# jail tmpdir: work around Bug 1553771
# https://bugzilla.mozilla.org/show_bug.cgi?id=1553771
# https://bugzilla.mozilla.org/show_bug.cgi?id=1742671
globalCacheDir="$(getCacheDir)"
if [ ! -z "${globalCacheDir}" ]; then
  cacheDir="$(mktemp -d -p "${globalCacheDir}")"
else
  cacheDir="$(mktemp -d)"
fi
if [ ! -z "${cacheDir}" ]; then
  trap "rm -rf '${cacheDir}'" EXIT INT TERM QUIT
fi

export TMPDIR="${cacheDir}"
export GCONF_TMPDIR="${TMPDIR}"
export KDETMP="${TMPDIR}"
export KDEVARTMP="${TMPDIR}"
export TEMP="${TMPDIR}"
export TMP="${TMPDIR}"

"$basedir/konform-bin" "$@"
