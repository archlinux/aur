# Maintainer: Bidossessi Sodonon

pkgname=python2-ofxparse
_pkgname=ofxparse
pkgver=0.14
pkgrel=3
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
url=http://sites.google.com/site/ofxparse
arch=('any')
license=(MIT)
provides=("$pkgname")
depends=(
    'python2'
    'python2-beautifulsoup4'
)
makedepends=(
  'python2-setuptools'
)
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('4ad8a34e008d4893a61eadd593176f0f')
md5sums=('4ad8a34e008d4893a61eadd593176f0f')
md5sums=('4ad8a34e008d4893a61eadd593176f0f')
