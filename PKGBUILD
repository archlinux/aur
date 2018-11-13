# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=5.0.2
pkgrel=1
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("3f32b4f91f499675afb86f5de6a594721be67bf57a33a9be4624ba0da0f0f230be730171f6f546116770f3768bb7227b2b84f21593c28971982e3a1dca4989d6")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  make install DESTDIR="${pkgdir}"
}

