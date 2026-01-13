# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=python-jsonpath-rw
pkgver=1.4.0
pkgrel=2
pkgdesc="A robust and significantly extended implementation of JSONPath for Python."
arch=(any)
url=https://github.com/kennknowles/python-jsonpath-rw
license=(Apache)
makedepends=(python-setuptools)
checkdepends=(python)
depends=(python python-ply python-decorator python-six)
source=("https://github.com/kennknowles/python-jsonpath-rw/archive/$pkgver.tar.gz")
sha256sums=(0aac3458f78b115e661a51610b631c46f27c8b6a4446e4dafb9a13b5ddb5d5e7)

check() {
  cd $pkgbase-$pkgver
  python -m unittest discover
}

package() {
  cd $pkgbase-$pkgver
  python setup.py install --root=$pkgdir
}
