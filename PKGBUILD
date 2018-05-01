# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
pkgname=libfaction
_pkgname=faction
pkgver=0.0.2
pkgrel=1
pkgdesc="A C library for test-driven software development"
arch=("x86_64" "i686")
url="https://timetoplatypus.com/static/faction"
license=("BSD")
source=("https://timetoplatypus.com/static/faction/$_pkgname-$pkgver.tar.gz")
md5sums=("01cd2824db81340f2fd142587c5f9517")

package() {
  mkdir -p "$pkgdir/usr/include/"
  cp "$srcdir/$_pkgname/include/faction.h" "$pkgdir/usr/include/$_pkgname.h"
}
