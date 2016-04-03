# Contributor: Lenart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=python-svg.path
pkgver=2.1.1
pkgrel=3
pkgdesc="SVG path objects and parser"
arch=(any)
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python')

source=(https://pypi.python.org/packages/source/s/svg.path/svg.path-${pkgver}.tar.gz)
md5sums=('487a6429e495c9d2f8baaf15d9d0d216')

package() {
cd "${srcdir}/svg.path-${pkgver}"
python setup.py install --root="${pkgdir}" --optimize=1
}
