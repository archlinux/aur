# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-utils
pkgver=2.0.0
pkgrel=1
pkgdesc="A module with some convenient utilities not included with the standard Python install"
arch=('any')
url="https://github.com/WoLpH/python-utils"
license=('BSD')
depends=('python' 'python-six')
source=("https://github.com/WoLpH/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e14822f414d474c88d3a75b5e0b48f4f1f2403e2879b7fd8df648a1a4358dd98')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
