#!/usr/bin/env bash
set -euo pipefail

discordUrl="$(curl -o /dev/null -LsI -w '%{url_effective}' 'https://discord.com/api/download?platform=linux&format=tar.gz')"
latestDiscordVersion="$(echo "$discordUrl" | pcregrep -o1 '/([0-9]*\.[0-9]*\.[0-9]*)/')"
currentDiscordVersion="$(pcregrep -o1 '^pkgver=([^+]+)' PKGBUILD)"

latestElectronVersion="$(pacman -qSs electron | pcregrep -o1 '^electron([0-9]{2})' | sort -V | tail -n1)"
currentElectronVersion="$(pcregrep -o1 '^_electron=([0-9]+)' PKGBUILD)"
# TODO: Actually do something with the electron version

if [[ "$currentDiscordVersion" = "$latestDiscordVersion" && "$currentElectronVersion" = "$latestElectronVersion" ]]; then
  echo " [*] discord and electron versions are up to date"
  echo "      discord: ${currentDiscordVersion}"
  echo "      electron: ${currentElectronVersion}"
  exit 0
fi

if [[ "$currentDiscordVersion" != "$latestDiscordVersion" ]]; then
  echo " [*] Updating discord version ${currentDiscordVersion} -> ${latestDiscordVersion}"

  # Update pkgver
  pushd "src/openasar"
  pkgver=$(printf "%s+%s.%s" "$latestDiscordVersion" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  popd
  sed -i "s/^pkgver=.*/pkgver=$pkgver/" PKGBUILD

  # Update checksums
  updpkgsums

  # Update .SRCINFO
  makepkg --printsrcinfo > .SRCINFO

  git add PKGBUILD .SRCINFO
  git commit -m "chore!: update to discord ${latestDiscordVersion}"
fi

if [[ "$currentElectronVersion" != "$latestElectronVersion" ]]; then
  echo " [*] Updating electron version ${currentElectronVersion} -> ${latestElectronVersion}"
  sed -i "s/^_electron=.*/_electron=$latestElectronVersion/" PKGBUILD

  # Update .SRCINFO
  makepkg --printsrcinfo > .SRCINFO

  git add PKGBUILD .SRCINFO
  git commit -m "chore!: update to electron ${latestElectronVersion}"
fi

git push origin master
