# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=cityinfo
pkgver=0.5.18
pkgrel=1
pkgdesc="Cityinfo library allows to get some informations about cities."
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(LGPL)
makedepends=(gconf glib2 git)
groups=(maemo)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  make
 }

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
}
