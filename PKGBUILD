# Maintainer: Rhinoceros

pkgname=scim-spreadsheet
pkgver=0.1.8
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/scim'
license=('custom')
source=("https://github.com/andmarti1424/${pkgname%-spreadsheet}/archive/v${pkgver}.tar.gz")
sha256sums=('427f05b3555efe47aebc3fd4ea8e9da75c5eb88a62f15fd7f5b9ad0fc3ea5162')

build() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make
}

package() {
  cd "${pkgname%-spreadsheet}-$pkgver/src"
  make DESTDIR="$pkgdir" install
}
