# Contributor: Lenart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=python-svg.path
pkgver=2.0.1
pkgrel=1
pkgdesc="SVG path objects and parser"
arch=(any)
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python')

source=(http://pypi.python.org/packages/source/s/svg.path/svg.path-${pkgver}.zip)
md5sums=('a35f436e901d11fa99fa3168aa4e569d')

package() {
  cd "${srcdir}/svg.path-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
