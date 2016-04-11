# Maintainer: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
pkgname=lektor
_pkgname=Lektor
pkgver=2.0.0
_pkgver=2.0
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
source=("https://pypi.python.org/packages/source/L/$_pkgname/$_pkgname-$_pkgver.tar.gz")
sha256sums=("e8a35a27c24a12b1c4a51d3fb72acfdf8580897f55a8cba9707d0259dad68b82")

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
