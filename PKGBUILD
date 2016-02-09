# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=('python-pex')
pkgver=1.1.2
pkgrel=1
arch=('any')
pkgdesc="a tool for generating executable Python environments"
url="https://github.com/pantsbuild/pex"
license=('Apache 2.0')
depends=('python' 'python-setuptools' 'python-wheel')
source=("https://pypi.python.org/packages/source/p/pex/pex-${pkgver}.tar.gz")
md5sums=('03386d82485ff125961093ada0ba91de')

package() {
  cd "${srcdir}/pex-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
