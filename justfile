update:
  #!/usr/bin/env bash
  set -euxo pipefail

  source PKGBUILD
  old_pkgver=$pkgver

  makepkg --printsrcinfo > .SRCINFO

  source PKGBUILD
  if [ "$old_pkgver" = "$pkgver" ]; then
    sed --regexp-extended --in-place -E "0,/pkgrel=.+$/{s/(pkgrel=)(.+$)/\1$((pkgrel+1))/}" ./PKGBUILD
  else
    sed --regexp-extended --in-place -E "0,/pkgrel=.+$/{s/(pkgrel=)(.+$)/\11/}" ./PKGBUILD
  fi

  makepkg --printsrcinfo > .SRCINFO
  git commit --all --message $pkgver
