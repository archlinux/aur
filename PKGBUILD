# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-bitvector
pkgver=3.5.0
pkgrel=4
pkgdesc="A memory-efficient packed representation for bit arrays in pure Python"
url="https://pypi.python.org/pypi/BitVector"
license=('PSF')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/B/BitVector/BitVector-$pkgver.tar.gz")
sha512sums=('c303b77f0f6ea4fb80233afb09e0f830e0beb8cbe17d9bff242a4b6465ec34a5621b1003f5cb8e139460a27bb4fb897960e3dce92eb30b95bef55aa6aa5f0827')

build() {
  cd BitVector-$pkgver
  python setup.py build
}

package() {
  cd BitVector-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
