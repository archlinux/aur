# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=knack
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc="A Python command line interface framework"
arch=('any')
url="https://github.com/Microsoft/knack"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/knack/archive/${pkgver}.tar.gz")
sha256sums=('b60f72707b4ec9a2c9b79a6176e32b174ec40c400722f9aa9a653b2f60ace605')

build() {
  cd "$_name-$pkgver"

  python setup.py build;
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
