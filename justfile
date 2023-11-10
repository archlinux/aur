update version:
  #!/usr/bin/env bash
  set -euxo pipefail

  sed --regexp-extended --in-place -E "0,/pkgver=.+$/{s/(pkgver=)(.+$)/\1{{version}}/}" ./PKGBUILD
  shas=$(makepkg --geninteg)
  sed --regexp-extended --in-place -E "0,/sha512sums=.+$/{s/sha512sums=.+$/${shas}/}" ./PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git commit --all --message $(echo {{version}} | tr -d '"'})