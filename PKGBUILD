# Maintainer: Daniel Micay <danielmicay@gmail.com>
pkgname=(python-scrypt python2-scrypt)
pkgver=0.6.1
pkgrel=1
pkgdesc='Bindings for the scrypt key derivation function library'
arch=(i686 x86_64)
url='http://pypi.python.org/pypi/scrypt/'
license=('BSD')
makedepends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/scrypt/scrypt-$pkgver.tar.gz")
md5sums=('1af78108db9f3bd189b0d78f7eb4382d')

package_python-scrypt() {
  depends=(python)
  cd "scrypt-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-scrypt() {
  depends=(python2)
  cd "scrypt-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
