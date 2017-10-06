# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=curr
pkgver=1.0
pkgrel=1
pkgdesc="simple cli currency converter"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/curr"
depends=('python' 'python-setuptools' 'python-click' 'python-toml')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/curr/archive/v${pkgver}.tar.gz")
md5sums=('a2d275119b4ea5831748a59dbce12010')
package() {
  cd "${srcdir}/curr-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
