# Maintainer: Crass00 <crass00 @ hotmail . com>
pkgname=python2-unrar
pkgver=0.3
pkgrel=1
pkgdesc="Wrapper for UnRAR library, ctypes-based"
arch=('any')
url="https://pypi.python.org/pypi/unrar/"
license=('GPL-3')
depends=('python2' 'libunrar')
makedepends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/u/unrar/unrar-$pkgver.tar.gz")
sha256sums=('SKIP')
package() {
  cd "$srcdir/unrar-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
