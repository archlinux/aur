# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=python-lhafile
pkgname=python2-lhafile
pkgver=0.1.0fs4
pkgrel=1
pkgdesc="LHA archive support for Python 2"
arch=('i686' 'x86_64')
url="http://fengestad.no/python-lhafile/"
license=('BSD')
depends=('python2')
source=("http://fengestad.no/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cedac40d5363bf49b51528522bf05c60')


package() {
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
