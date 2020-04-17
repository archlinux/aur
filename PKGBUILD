# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
_pkgname=ijson
pkgver=3.0.1
pkgrel=1
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=('any')
url="https://github.com/isagalaev/ijson"
license=('custom')
depends=('python' 'yajl')
makedepends=('python-setuptools')
source=("https://github.com/ICRAR/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0de71830929c9fda9d5f7942511cad313c0df91ad4b4def2a0628e39e40adc52')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
