# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=ip2location-python
pkgname=ip2location-python2
pkgver=7.0.0
pkgrel=1
pkgdesc="Python2 library enables the user to find info of any IP address or hostname"
arch=(any)
url="http://www.ip2location.com/developers/python"
license=('GPL3')
depends=('python2')
source=("http://www.ip2location.com/downloads/$_pkgname-$pkgver.tar.gz")
sha256sums=('5111176a160ff5acd9fbd824038a2503a1b784a57eb48e712facc7716a8a4b5e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
