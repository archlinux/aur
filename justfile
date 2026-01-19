#!/usr/bin/env just --justfile

test: clean prep build check

prep:
  updpkgsums
  makepkg --printsrcinfo > .SRCINFO

build:
  makepkg -si

check:
  namcap PKGBUILD 
  @echo "→ Running namcap on PKGBUILD and built package..."
  pkgfile=$(ls *.pkg.tar.* 2>/dev/null | head -n1); \
  if [ -z "$pkgfile" ]; then \
      echo "No built package found. Run 'makepkg -si' first." >&2; \
      exit 1; \
  fi; \
  echo "Checking $pkgfile"; \
  namcap PKGBUILD "$pkgfile" \
    | grep -v "Dependency python-" \
    || true

clean:
  yay -Rns  --noconfirm python-yaucl
  rm -f *.tar.gz
  rm -f *.tar.zst
  rm -f -rf pkg/
  rm -f -rf src/
