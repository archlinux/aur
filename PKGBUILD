# Maintainer: liborw

pkgname=python-mqttools
pkgver=0.50.0
pkgrel=1
pkgdesc="MQTT version 5.0 client and broker using asyncio"
url="https://github.com/eerimoq/mqttools"
license=('MIT')
arch=("any")
depends=('python' 'python-bitstruct' 'python-humanfriendly')
makedepends=('python')
source=("mqttools-$pkgver.tar.gz::https://github.com/eerimoq/mqttools/archive/$pkgver.tar.gz")
sha256sums=('7e6cafe56ef74b28a262e99ba1a6be38bb600dc7406be5a7f2ff67906a3ae4f3')

build() {
  cd $srcdir/mqttools-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/mqttools-$pkgver
  python setup.py install --root $pkgdir
}



