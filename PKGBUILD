# Maintainer: Bidossessi Sodonon

pkgname=python2-pywebdav
_pkgname=PyWebDAV
pkgver=0.9.8
pkgrel=5
pkgdesc="WebDAV library including a standalone server for python"
url=http://code.google.com/p/pywebdav/
arch=('any')
license=(GPL3)
provides=("$_pkgname")
depends=(
    'python2'
    'python2-setuptools'
)
source=("https://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('2fd2aca0074f0d0ac2701c9c0cadb89e')
