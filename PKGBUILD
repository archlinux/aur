# Contributor: Lenart Regebro
# Maintainer: Fabien Devaux <fdev 31 at gmail dot com>

pkgname=python-svg.path
pkgver=2.0b1
pkgrel=2
pkgdesc="SVG path objects and parser"
arch=(any)
url="https://github.com/regebro/svg.path"
license=('CCPL')
depends=('python')

source=(http://pypi.python.org/packages/source/s/svg.path/svg.path-${pkgver}.zip)
md5sums=('900a981902fe0bb09534dcefdbba0ebc')

package() {
  cd "${srcdir}/svg.path-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
