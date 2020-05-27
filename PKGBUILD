# Maintainer: liborw

pkgname=python-mqttools
pkgver=0.36.0
pkgrel=1
pkgdesc="MQTT version 5.0 client and broker using asyncio"
url="https://github.com/eerimoq/mqttools"
license=('MIT')
arch=("any")
depends=('python' 'python-bitstruct' 'python-humanfriendly')
makedepends=('python')
source=("mqttools-$pkgver.tar.gz::https://github.com/eerimoq/mqttools/archive/$pkgver.tar.gz")
sha256sums=('911cc21d347f2def9c165f5186d18f7381c163e83115680694992c4c831af472')

build() {
  cd $srcdir/mqttools-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/mqttools-$pkgver
  python setup.py install --root $pkgdir
}



