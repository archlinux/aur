# Maintainer: 1ridic <i@iridium.cyou>
pkgname=wcs
pkgver=1.2.3
provides=('wcs')
conflicts=('wcs')
license=('GPL2')
pkgrel=1
pkgdesc="\"wcs\" Stream Meter"
arch=(x86_64)
url="https://www.tansi.org/tools/index.html"
depends=(glibc)
makedepends=(gcc)
source=("https://www.tansi.org/tools/wcs.c")
sha256sums=('SKIP')

build() {
	gcc wcs.c -o wcs
}

package() {
  install -Dm755 $srcdir/wcs $pkgdir/usr/bin/wcs
}


