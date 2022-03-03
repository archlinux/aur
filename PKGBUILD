# Maintainer: mekb https://github.com/mekb-turtle

pkgname=xclip-wrapper-git
pkgver=1.1
pkgrel=1
pkgdesc="Simple xclip wrapper for those who find the syntax too confusing"
arch=('any')
url="https://github.com/mekb-turtle/clip"
depends=('git' 'xclip')
source=("git+https://github.com/mekb-turtle/clip.git")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/clip
  make
}

package() {
  install -Dm755 ${srcdir}/clip/build/clip ${pkgdir}/usr/bin/clip
}
