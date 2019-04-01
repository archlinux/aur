# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-bitvector
pkgver=3.4.9
pkgrel=1
pkgdesc="A memory-efficient packed representation for bit arrays in pure Python"
url="https://pypi.python.org/pypi/BitVector"
license=('PSF')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/B/BitVector/BitVector-$pkgver.tar.gz")
sha512sums=('be2144a35990b46aa2cbd71d65db51baac5fec65d4c91a1e2222857b307c96f5551adf1c5a86f145f01fa895465b99bc02a485d5d7a43495dd1e05b9a0d9d513')

build() {
  cd BitVector-$pkgver
  python setup.py build
}

package() {
  cd BitVector-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
