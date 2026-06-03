#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

makepkg --printsrcinfo > .SRCINFO

json="$(curl -fsSL -H 'Accept: application/vnd.github+json' -H 'X-GitHub-Api-Version: 2022-11-28' 'https://api.github.com/repos/JS8Call-improved/JS8Call-improved/releases/latest')"
tag="$(jq -er '.tag_name' <<<"$json")"
latest="${tag#v}"
asset="JS8Call-v${latest}-x86_64.AppImage"

if [[ ! "$latest" =~ ^[0-9]+(\.[0-9]+){2}$ ]]; then
  printf 'Konnte keine plausible JS8Call-Version finden: %s\n' "$latest" >&2
  exit 1
fi

if ! jq -e --arg asset "$asset" '.assets[] | select(.name == $asset)' >/dev/null <<<"$json"; then
  printf 'Release %s enthält nicht das erwartete Linux-x86_64-AppImage: %s\n' "$latest" "$asset" >&2
  exit 1
fi

current="$(sed -nE 's/^pkgver=//p' PKGBUILD)"

if [[ "$latest" == "$current" ]]; then
  printf 'Keine neue Release-Version: JS8Call ist bereits bei %s.\n' "$current"

  if makepkg --verifysource -f; then
    makepkg --printsrcinfo > .SRCINFO
    printf 'Die Quellen sind unverändert; .SRCINFO wurde neu erzeugt.\n'
    exit 0
  fi

  read -r -p 'Release-Asset oder Zusatzquelle geändert. Als neues pkgrel übernehmen? [j/N] ' answer

  if [[ ! "$answer" =~ ^[jJyY]$ ]]; then
    printf 'Keine Änderung übernommen.\n'
    exit 1
  fi

  current_rel="$(sed -nE 's/^pkgrel=([0-9]+)$/\1/p' PKGBUILD)"
  if [[ ! "$current_rel" =~ ^[0-9]+$ ]]; then
    printf 'Konnte pkgrel nicht lesen.\n' >&2
    exit 1
  fi

  new_rel="$((current_rel + 1))"
  sed -i -E "s/^pkgrel=.*/pkgrel=$new_rel/" PKGBUILD
  printf 'Neues Release angelegt: %s-%s\n' "$current" "$new_rel"
else
  sed -i -E "s/^pkgver=.*/pkgver=$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
  printf 'Aktualisiert: %s -> %s\n' "$current" "$latest"
fi

updpkgsums
makepkg --printsrcinfo > .SRCINFO
git diff -- PKGBUILD .SRCINFO
printf 'Jetzt bauen, testen und anschließend committen.\n'
