# Maintainer: Wallun <wallun CAT disroot DOG org>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=bashlint
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple Bash linting tool written in Python"
arch=('any')
url="https://github.com/skudriashev/bashlint"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skudriashev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b213e703aea503ab279423bb2c419c4061fc821b36ff910129983136dc442f31')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
