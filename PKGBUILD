# Maintainer: Jake <ja.ke@posteo.de>

pkgname=python2-svg.path
pkgver=2.0.1
pkgrel=1
pkgdesc="SVG path objects and parser"
arch=('any')
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/s/svg.path/svg.path-${pkgver}.tar.gz)
md5sums=('a35f436e901d11fa99fa3168aa4e569d')

package() {
  cd "${srcdir}/svg.path-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}