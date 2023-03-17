#!/bin/bash

# To get changes made somewhere else
git pull

maxVersionDifference=20

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$scriptdir"

#if [[ -f STOP_AUTOMATIC_UPDATE ]]; then
#  >&2 echo "Automatic updates are disabled via STOP_AUTOMATIC_UPDATE."
#  exit 1
#fi

upstreamVersion="$(curl -s "https://josm.openstreetmap.de/latest")"

if [[ ! $upstreamVersion =~ ^[0-9]{5}$ ]]; then
  >&2 echo "Invalid upstream version $upstreamVersion."
  exit 1
fi

pkgbuildVersion="$(grep -Po '(?<=pkgver=)\d+' PKGBUILD)"

if [[ ! $pkgbuildVersion =~ ^[0-9]{5}$ ]]; then
  >&2 echo "Invalid PKGBUILD version $pkgbuildVersion."
  exit 1
fi

#if [[ $((upstreamVersion - pkgbuildVersion)) -gt $maxVersionDifference ]]; then
#  >&2 echo "Update would exceed maxVersionDifference of $maxVersionDifference ($pkgbuildVersion->$upstreamVersion). Disabling further automatic updates."
#  touch STOP_AUTOMATIC_UPDATE
#  exit 1
#fi

if [[ $upstreamVersion -gt $pkgbuildVersion ]]; then
  echo "Found new upstream version $upstreamVersion (was $pkgbuildVersion)."

  sed -r -i -e 's/(pkgver=)[0-9]+/\1'$upstreamVersion'/' PKGBUILD
  sed -r -i -e 's/(pkgrel=)[0-9]+/\11/' PKGBUILD

  sed -r -i -e 's/(pkgver = )[0-9]+/\1'$upstreamVersion'/' .SRCINFO
  sed -r -i -e 's/(pkgrel = )[0-9]+/\11/' .SRCINFO
  sed -r -i -e 's/(josm)[0-9]+/\1'$upstreamVersion'/' .SRCINFO

  git commit --no-signoff PKGBUILD .SRCINFO -m "Automatic update ($pkgbuildVersion->$upstreamVersion)"
  git push
else
  echo "No new upstream version found (upstream $upstreamVersion, PKGBUILD $pkgbuildVersion)."
fi
