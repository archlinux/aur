# Contributor: Pedro Martinez-Julia (pedromj@um.es)

pkgname=python-bitarray
pkgver=2.3.5
pkgrel=1
pkgdesc="Efficient arrays of booleans for Python"
arch=('i686' 'x86_64')
url="https://github.com/ilanschnell/bitarray"
license=('PSF')
depends=('python')
makedepends=('python-distribute')
source=(https://files.pythonhosted.org/packages/source/b/bitarray/bitarray-$pkgver.tar.gz)
sha256sums=('60285184cb02fdba5e1cc8605ac84e150a50f940e9383ab43564e5258d1f47bb')

package() {
  cd "$srcdir"/bitarray-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
