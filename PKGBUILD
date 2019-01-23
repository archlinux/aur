# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=mts-utils
pkgver=2.0.2
pkgrel=1
pkgdesc='MPEG Transport Stream Utilities (tstools fork, includes tsplay)'
arch=(x86_64)
url='https://github.com/xyproto/mts-utils'
license=(MPL)
makedepends=(cxx git)
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
  make -C "$pkgname"
}

package() {
  PREFIX=/usr DESTDIR="$pkgdir" make -C "$pkgname" install
}

# vim: ts=2 sw=2 et:
