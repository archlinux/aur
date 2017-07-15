# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-utils
pkgver=2.1.0
pkgrel=1
pkgdesc="A module with some convenient utilities not included with the standard Python install"
arch=('any')
url="https://github.com/WoLpH/python-utils"
license=('BSD')
depends=('python' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7fd8fb698b114ea3630328bb7267078a31a5eebc67c8dfcc1e35d5f329aa9ace')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
