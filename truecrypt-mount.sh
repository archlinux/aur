#!/usr/bin/env sh
DEV="$1"
MNTPT="$2"
OPTIONS=""
TCOPTIONS=""
shift 3
IFS=','
for arg in $*; do
  if [ "${arg}" == "system" ]; then
    TCOPTIONS="${TCOPTIONS}-m=system "
  elif [[ "${arg}" == fs=* ]]; then
    FS=${arg#*=}
    TCOPTIONS="${TCOPTIONS}--filesystem=${FS} "
  else
    OPTIONS="${OPTIONS}${arg},"
  fi
done
exec truecrypt ${DEV} ${MNTPT} ${TCOPTIONS% *} --fs-options="${OPTIONS%,*}"
