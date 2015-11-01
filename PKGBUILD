pkgname=libbtbb
pkgver=2015.10.R1
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python')
source=("https://github.com/greatscottgadgets/libbtbb/archive/2015-10-R1.tar.gz")
md5sums=('2315216adf16a0cee06e237c62122698')

build() {
  cd "${srcdir}/${pkgname}-2015-10-R1/"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-2015-10-R1/build/"
  make install
}
