# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=curr
pkgver=1.12
pkgrel=1
pkgdesc="simple cli currency converter"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/curr"
depends=('python' 'python-setuptools' 'python-click' 'python-toml' 'python-logzero')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/curr/archive/v${pkgver}.tar.gz")
md5sums=('d4c098e9df3efe68b59b3b7c045ef735')
package() {
  cd "${srcdir}/curr-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
