# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-utils
pkgver=2.0.1
pkgrel=1
pkgdesc="A module with some convenient utilities not included with the standard Python install"
arch=('any')
url="https://github.com/WoLpH/python-utils"
license=('BSD')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('615bf41699b84bf231ad644e00101610f94182aed9170926cebbbff7ebdfec2e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
