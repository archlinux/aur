# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=qtile-plasma
pkgver=1.5.0
pkgrel=1
pkgdesc="A flexible, tree-based layout for Qtile"
arch=(any)
license=('MIT')
url="https://github.com/numirias/qtile-plasma"
depends=('python' 'python-setuptools' 'qtile')
makedepends=('python-setuptools')
source=("https://github.com/numirias/qtile-plasma/archive/v${pkgver}.tar.gz")
md5sums=('fbdaa9fd36a55cb2a3e1683db95d1443')
package() {
  cd "${srcdir}/qtile-plasma-${pkgver}"
  python setup.py install --root="${pkgdir}"
  echo "qtile-plasma installed successfully, however it still needs to be enabled in your config"
  echo "See configuration introduction here: https://github.com/numirias/qtile-plasma/blob/master/README.md#installation"
}
