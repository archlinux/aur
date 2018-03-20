#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$scriptdir"

upstreamVersion="$(curl -s "https://josm.openstreetmap.de/latest")"

if [[ ! $upstreamVersion =~ ^[0-9]+$ ]]; then
  >&2 echo "Unable to fetch upstream version."
  exit 1
fi

pkgbuildVersion="$(grep -Po '(?<=pkgver=)\d+' PKGBUILD)"

if [[ ! $pkgbuildVersion =~ ^[0-9]+$ ]]; then
  >&2 echo "Unable to fetch PKGBUILD version."
  exit 1
fi

if [[ $upstreamVersion -gt $pkgbuildVersion ]]; then
  echo "Found new upstream version $upstreamVersion (was $pkgbuildVersion)."

  sed -r -i -e 's/(pkgver=)[0-9]+/\1'$upstreamVersion'/' PKGBUILD
  sed -r -i -e 's/(pkgrel=)[0-9]+/\11/' PKGBUILD

  sed -r -i -e 's/(pkgver = )[0-9]+/\1'$upstreamVersion'/' .SRCINFO
  sed -r -i -e 's/(pkgrel = )[0-9]+/\11/' .SRCINFO
  sed -r -i -e 's/(josm)[0-9]+/\1'$upstreamVersion'/' .SRCINFO

  git add PKGBUILD .SRCINFO
  git commit -m "Automatic update ($pkgbuildVersion->$upstreamVersion)"
  # git push
else
  echo "No new upstream version found (upstream $upstreamVersion, PKGBUILD $pkgbuildVersion)."
fi
