update:
  #!/usr/bin/env bash
  set -euxo pipefail

  makepkg --printsrcinfo > .SRCINFO
  source PKGBUILD
  git commit --all --message $pkgver
