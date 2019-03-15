# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=srcinfo
pkgver=0.0.0
pkgrel=0
pkgdesc="Read from PKGBUILD and write to .SRCINFO"
arch=(any)
url="https://github.com/KSXGitHub/srcinfo.pkgbuild.git"
license=(MIT)
depends=(pacman bash)

build() {
  (
    echo '#! /usr/bin/env bash'
    echo 'makepkg --printsrcinfo > .SRCINFO'
  ) > srcinfo
}

package() {
  install -Dm755 srcinfo "$pkgdir"/usr/bin/srcinfo
}
