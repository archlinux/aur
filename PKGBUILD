# Maintainer: Bidossessi Sodonon

pkgname=python2-zsi
_pkgname=ZSI
pkgver=2.0
_pkgsubver=rc3
pkgrel=1
pkgdesc="Zolera SOAP Infrastructure"
url=http://pywebsvcs.sourceforge.net
arch=('any')
license=(GPL3)
provides=("$_pkgname")
replaces=('zsi')
conflicts=('zsi')
depends=(
    'python2'
)
source=("https://pypi.python.org/packages/source/Z/${_pkgname}/${_pkgname}-${pkgver}-${_pkgsubver}.tar.gz")
package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}-${_pkgsubver}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('22fda3fbf7349de14d18f4cf7f947cb0')
