# Contributor: Pedro Martinez-Julia (pedromj@um.es)

pkgname=python-bitarray
pkgver=0.8.1
pkgrel=1
pkgdesc="Efficient arrays of booleans for Python"
arch=('i686' 'x86_64')
url="https://github.com/ilanschnell/bitarray"
license=('PSF')
depends=('python')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/b/bitarray/bitarray-$pkgver.tar.gz)
sha256sums=('7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18')

package() {
  cd "$srcdir"/bitarray-$pkgver
  python setup.py install --root="$pkgdir" -O1
}

