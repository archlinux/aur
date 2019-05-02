# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=egcc
pkgver=2.3.0
pkgrel=1
pkgdesc='An experiment in garbage collected C'
arch=(x86_64)
url='https://github.com/xyproto/egcc'
license=(GPL2)
depends=(gc)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  make -C $pkgname
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
