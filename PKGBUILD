# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='pid-tools'
pkgdesc="Some commandline tools for dealing with pids, information about processes, and their relations"
pkgver=5.0.1
pkgrel=1
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/pid-tools"
makedepends=('gcc' 'make')
source=("https://github.com/kata198/pid-tools/archive/${pkgver}.tar.gz")
sha512sums=("fad07a5a5007a3e5b03151cb5b81f3d3004194e3b39e820ddababd0318b822d479d1849cbd47ad1c0fa36635b66939ef0f15c4e029a07ab451f9dd8d7dfa05a4")

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  make
}

package() {
  cd "${pkgname}-$pkgver"

  make install DESTDIR="${pkgdir}"
}

