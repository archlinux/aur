# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

pkgname=python2-jellyfish
pkgver=0.2.0
pkgrel=1
pkgdesc="A python library for doing approximate and phonetic matching of strings"
license=("BSD")
url="https://pypi.python.org/pypi/jellyfish/0.1.2"
depends=('python2')
makedepends=()
source=("http://pypi.python.org/packages/source/j/jellyfish/jellyfish-${pkgver}.tar.gz")
arch=('any')

check() {
  cd "${srcdir}/jellyfish-${pkgver}"
  python2 setup.py test
}

package() {
  cd "${srcdir}/jellyfish-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
md5sums=('8f5d27bddd8986408f7004814982b202')
