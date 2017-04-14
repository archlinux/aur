# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-guess-language
_pyname=guess-language
pkgver=0.2
pkgrel=1
pkgdesc="Attempts to determine the natural language of a selection of Unicode (utf-8) text."
url="http://code.google.com/p/guess-language"
arch=('any')
license=('LGPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/e4/d0/df50192865e44af5c934504d413514158c5e522b00d8ec631d818b6d8b6b/${_pyname}-${pkgver}.tar.gz)
md5sums=('3a3574c2e8b44f84e656f90684f0c6aa')

package() {
  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}
