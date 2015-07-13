# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com> 

pkgname=python2-esky
pkgver=0.9.8
pkgrel=1
pkgdesc="keep frozen apps fresh"
arch=('any')
url="https://pypi.python.org/pypi/esky/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/e/esky/esky-$pkgver.tar.gz")
md5sums=('8e09b27df237927b09e59af396c6098c')

build() {
  cd "${srcdir}/esky-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/esky-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
