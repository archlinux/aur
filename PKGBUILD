# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
_pkgname=ijson
pkgver=2.3
pkgrel=1
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=('any')
url="https://github.com/isagalaev/ijson"
license=('custom')
depends=('python' 'yajl')
makedepends=('python-setuptools')
source=("https://github.com/isagalaev/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5db72cc5ebad786ee2cf85ae277ae068c14f965e0747fd8b65bf4d8d9c4c8395')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
