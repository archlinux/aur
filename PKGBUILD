# Maintainer: liborw

pkgname=python-mqttools
pkgver=0.35.0
pkgrel=1
pkgdesc="MQTT tools in Python 3.7 and later"
url="https://github.com/eerimoq/mqttools"
license=('MIT')
arch=("any")
depends=('python' 'python-bitstruct' 'python-humanfriendly')
makedepends=('python')
source=("mqttools-$pkgver.tar.gz::https://github.com/eerimoq/mqttools/archive/$pkgver.tar.gz")
sha256sums=('cbdbcbb4809f72c7287113d8812f2404aa571effe71e45ae1dbef03d10047778')

build() {
  cd $srcdir/mqttools-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/mqttools-$pkgver
  python setup.py install --root $pkgdir
}



