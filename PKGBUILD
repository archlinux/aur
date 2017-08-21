# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=seabreeze
pkgver=3.0.11
pkgrel=1
pkgdesc="SeaBreeze is a device driver library that provides an interface to select Ocean Optics spectrometers"
arch=('any')
url="https://oceanoptics.com/product/seabreeze/"
license=('MIT')
source=("https://downloads.sourceforge.net/project/seabreeze/SeaBreeze/source/seabreeze-${pkgver}.zip")
md5sums=('163aa19239838bf87462acc6eef7838c')
depends=('libusb')

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  make
}

package() {
  cd "$srcdir/$pkgname"

}
