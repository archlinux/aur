# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname='python2-pycrypto'
pkgver=2.6.1
pkgrel=1
pkgdesc='Cryptographic primitives and algorithms for Python'
arch=('any')
url='https://pypi.python.org/pypi/pycrypto'
license=('Public domain')
depends=('python2-flask')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/pycrypto/pycrypto-${pkgver}.tar.gz")
md5sums=('55a61a054aa66812daf5161a0d5d7eda')

build() {

  cd "${srcdir}/pycrypto-${pkgver}"
  python2 ./setup.py build

}

package() {

  cd "${srcdir}/pycrypto-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
