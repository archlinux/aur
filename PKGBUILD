# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=python-discid
_pkgname=discid
_python=python
pkgver=0.1.0
pkgrel=1
pkgdesc="Python binding of Libdiscid"
arch=('any')
url="https://github.com/JonnyJD/python-discid"
license=('LGPL3')
depends=('python' 'libdiscid')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('12b902fefbbb09effa7164fb87903291')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py build
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
