# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
pkgver=1.2.1
pkgrel=1
pkgdesc="A static content management system."
arch=(any)
url="https://www.getlektor.com"
license=('BSD')
depends=(python2 python2-pip python2-requests python2-babel
    python2-flask python2-watchdog python2-click python2-pyasn1
    python2-ndg-httpsclient python2-mistune python2-inifile exifread)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=("https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("2bd739579d4298547dd6ec5a1da74bf48236a66c1813bd07e44306fb750224de")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
