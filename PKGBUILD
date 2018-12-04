# Contributor(s): Michal Krenek (Mikos) <m.krenek@gmail.com>
# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=python-quamash
_pkgname=Quamash
pkgpath="01/1e/cf6f3c38cee61ed04fea58667f673adc67d6412eba0b3327dbb5732c1177"
pkgver=0.6.1
pkgrel=1
pkgdesc="Implementation of the asyncio (PEP 3156) event-loop with Qt"
arch=('any')
url="https://github.com/harvimt/quamash"
license=('BSD')
depends=('python-pyqt5')
makedepends=('python-setuptools' 'icu')
source=("https://files.pythonhosted.org/packages/${pkgpath}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6a31a6c9be7c20591e65a082b87566c82ccdfee4a7a11714655bd41b98f61b5c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
}
