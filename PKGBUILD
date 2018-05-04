# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
pkgname=libfaction
_pkgname=faction
pkgver=0.0.2
pkgrel=2
pkgdesc="A C library for test-driven software development"
arch=("x86_64" "i686")
url="https://timetoplatypus.com/static/faction"
license=("BSD")
source=("https://timetoplatypus.com/static/faction/$_pkgname-$pkgver.tar.gz")
md5sums=("5c8c701340783335edc11661ac8f94dd")

package() {
  mkdir -p "$pkgdir/usr/include/"
  cp "$srcdir/$_pkgname/include/faction.h" "$pkgdir/usr/include/$_pkgname.h"
}
