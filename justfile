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
    | grep -v "site-packages" \
    | grep -v "opt/pipx" \
    | grep -v "ELF files outside" \
    | grep -v "Dependency included" \
    | grep -v "uninstalled dependency" \
    || true

clean:
  yay -Rns  --noconfirm tofuref-bin
  rm *.tar.gz
  rm *.tar.zst
  rm -rf pkg/
  rm -rf src/
