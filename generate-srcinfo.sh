#!/bin/bash

set -e

if [[ 0 -ne $# ]]; then
  echo "Usage: $0" >&2
  echo "       $0 <-h|--help|help>" >&2

  case "$1" in
    -h|--help|help)
      exit 0
      ;;
    *)
      exit 1
      ;;
  esac
fi

if [[ ! -f 'PKGBUILD' ]]; then
  echo 'Cannot find PKGBUILD!' >&2
  exit 2
fi

# shellcheck disable=SC1091
source './PKGBUILD'

makepkg --printsrcinfo > '.SRCINFO'

# shellcheck disable=SC2154
for _locale in "${!_languages[@]}"; do
  pkgname_pattern="^pkgname = $pkgbase-$(tr '[:upper:]' '[:lower:]' <<< "$_locale")$"

  # Information parameters are in reverse order.
  for info in \
      "conflicts = firefox-i18n-$(tr '[:upper:]' '[:lower:]' <<< "$_locale")" \
      "provides = firefox-i18n-$(tr '[:upper:]' '[:lower:]' <<< "$_locale")=$pkgver" \
      "provides = $pkgbase=$pkgver-$pkgrel" \
      "pkgdesc = ${_languages["$_locale"]} language pack for Firefox Beta"; do
    sed -e "s/$pkgname_pattern/\\0\\n\\t$info/" \
        -i '.SRCINFO'
  done
done

# vim: set ts=2 sw=2 et syn=sh:
