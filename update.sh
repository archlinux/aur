#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

makepkg --printsrcinfo > .SRCINFO

latest="$(
  curl -fsSL "https://downloads.winlink.org/VARA%20Products/" \
    | grep -oE 'VARA HF v[0-9]+(\.[0-9]+)+[[:space:]]+setup\.zip' \
    | sed -E 's/^.*v([0-9.]+).*$/\1/' \
    | sort -V \
    | tail -n1
)"

if [[ ! "$latest" =~ ^[0-9]+(\.[0-9]+){2}$ ]]; then
  printf 'Konnte keine plausible VARA-HF-Version finden.\n' >&2
  exit 1
fi

current="$(sed -nE 's/^pkgver=//p' PKGBUILD)"

if [[ "$latest" == "$current" ]]; then
  printf 'Keine Änderung: VARA HF ist bereits bei %s.\n' "$current"
  
  if makepkg --verifysource -f; then
    printf 'Keine Änderung: VARA HF ist bereits bei %s und die Quellen sind unverändert.\n' "$current"
    exit 0
  fi

  read -r -p 'Änderung geprüft und als neues pkgrel übernehmen? [j/N] ' answer

  if [[ ! "$answer" =~ ^[jJyY]$ ]]; then
    printf 'Keine Änderung übernommen.\n'
    exit 1
  fi

  current_rel="$(sed -nE 's/^pkgrel=([0-9]+)$/\1/p' PKGBUILD)"
  new_rel="$((current_rel + 1))"

  sed -i -E "s/^pkgrel=.*/pkgrel=$new_rel/" PKGBUILD

  printf 'Neues Release angelegt: %s-%s\n' "$current" "$new_rel"
  printf 'Jetzt bauen, testen und anschließend committen.\n'
else
  sed -i -E "s/^pkgver=.*/pkgver=$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
  printf 'Aktualisiert: %s -> %s\n' "$current" "$latest"
  printf 'Jetzt bauen, testen und anschließend committen.\n'
fi

updpkgsums
makepkg --printsrcinfo > .SRCINFO
git diff -- PKGBUILD .SRCINFO
