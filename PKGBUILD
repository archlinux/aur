# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=ip2location-python
pkgver=7.0.0
pkgrel=1
pkgdesc="Python library enables the user to find info of any IP address or hostname"
arch=(any)
url="http://www.ip2location.com/developers/python"
license=('GPL3')
depends=('python')
source=("http://www.ip2location.com/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('5111176a160ff5acd9fbd824038a2503a1b784a57eb48e712facc7716a8a4b5e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
