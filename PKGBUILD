# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-gtfparse'
pkgver=0.0.1
pkgrel=1
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache-2.0')
depends=('python' 'python-numpy>=1.7' 'python-pandas>=0.15')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/82/64/6a892f9830ab02bdeebb875296cacf25809bea59baed11d7db34714c0a8d/gtfparse-${pkgver}.tar.gz")
md5sums=('46d1328d146a727aa777b04b151847f3')

package() {
  cd "${srcdir}/gtfparse-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
