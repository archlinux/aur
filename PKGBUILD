# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ijson
pkgver=3.1.2.post0
pkgrel=1
pkgdesc="Iterative JSON parser with Pythonic interface"
arch=(x86_64)
url="https://github.com/isagalaev/ijson"
license=('custom')
depends=('python' 'yajl')
makedepends=('python-setuptools')
source=("https://github.com/ICRAR/ijson/archive/v${pkgver}.tar.gz")
sha256sums=('4440b8cff2ded9788b60e6d56da7ae2ca70424abc3f39f6d97e6239c90176cdf')

build() {
  cd ijson-$pkgver
  python setup.py build
}

package(){
  cd ijson-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
