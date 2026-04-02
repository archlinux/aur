#!/usr/bin/env just --justfile

test: clean prep build check

prep:
  updpkgsums
  makepkg --printsrcinfo > .SRCINFO

build:
  paru -Bi .

check:
  #!/usr/bin/env bash
  set -euo pipefail
  namcap PKGBUILD
  echo "-> Running namcap on built package..."
  pkgfile=$(ls *.pkg.tar.* 2>/dev/null | head -n1)
  if [ -z "$pkgfile" ]; then
      echo "No built package found. Run 'paru -Bi .' first." >&2
      exit 1
  fi
  echo "Checking $pkgfile"
  namcap "$pkgfile"

clean:
  paru -Rns --noconfirm cheznav || true
  rm -f *.tar.gz
  rm -f *.tar.zst
  rm -f -rf pkg/
  rm -f -rf src/
