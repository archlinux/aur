# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=curr
pkgver=1.11
pkgrel=1
pkgdesc="simple cli currency converter"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/curr"
depends=('python' 'python-setuptools' 'python-click' 'python-toml')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/curr/archive/v${pkgver}.tar.gz")
md5sums=('d91788f066921bf84122659b14b3168f')
package() {
  cd "${srcdir}/curr-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
