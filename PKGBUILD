# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-progressbar33'
pkgver=2.4
pkgrel=1
pkgdesc="Text progress bar library for Python"
arch=('any')
url="https://pypi.python.org/pypi/progressbar33"
license=('Apache-2.0')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/71/fc/7c8e01f41a6e671d7b11be470eeb3d15339c75ce5559935f3f55890eec6b/progressbar33-${pkgver}.tar.gz")
md5sums=('94c114ea62aaae93489848f5bdb0bbe7')

package() {
  cd "${srcdir}/progressbar33-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
