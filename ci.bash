#!/usr/bin/env bash
#git clean -dfX 
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}" || return

git reset --hard HEAD
git checkout main
git clean -f .
git pull --prune
# Weird pgrep fail with the complete binary name
if pgrep -a do-not-directly|grep alchemy ; then
	echo "Aborting package build because Alchemy is running"
	exit 0
fi
BUILDENV=(!distcc color !ccache check) makepkg --cleanbuild --clean --sync --install --noconfirm --needed
