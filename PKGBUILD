# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=bashlint
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple Bash linting tool written in Python"
arch=('any')
url="https://github.com/skudriashev/bashlint"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/skudriashev/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e23df57b2297dd94b8f1f3718e3abd22adff382a37d53ce3565d1ef511f64132')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
