update:
  #!/usr/bin/env bash
  set -euxo pipefail

  version=$(printf r%s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD))

  sed --regexp-extended --in-place -E "0,/pkgver=.+\$/{s/(pkgver=)(.+\$)/\1$version/}" ./PKGBUILD
  shas=$(makepkg --geninteg)
  sed --regexp-extended --in-place -E "0,/sha512sums=.+\$/{s/sha512sums=.+\$/${shas}/}" ./PKGBUILD
  makepkg --printsrcinfo > .SRCINFO
  git commit --all --message $version
