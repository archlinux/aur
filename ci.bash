#!/usr/bin/env bash
git clean -dfX 
unset AL_GIT_BRANCH
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}" || return

echo "stashing changes"
#Stash any existing changes
git stash
# pull and generate version as per PKGBUILD
echo "restarting clean configure..."
makepkg --sync --nobuild --cleanbuild
# makepkg --sync
echo "printing new info to files"
makepkg -g
makepkg --print > "${DIR}/.SRCINFO"
#if changes, commit and push
if git status --porcelain | grep -P '^\s*M'; then
	git commit PKGBUILD .SRCINFO -m "Automated version bump" --no-gpg-sign && git push
fi
