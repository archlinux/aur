# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=knack
pkgname=python-$_name
pkgver=0.5.1
pkgrel=1
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/knack/archive/v${pkgver}.tar.gz")
sha256sums=('4445040efd93b21055b604b781355516f4c35a569788d3f156bcb449740fc752')

build() {
  cd "$_name-$pkgver"

  python setup.py build;
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
