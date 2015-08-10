# Maintainer: Crass00 <crass00 @ hotmail . com>
pkgname=python2-unrar
pkgver=0.3
pkgrel=2
pkgdesc="Wrapper for UnRAR library, ctypes-based"
arch=('any')
url="https://pypi.python.org/pypi/unrar/"
license=('GPL-3')
depends=('python2' 'libunrar')
makedepends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/u/unrar/unrar-$pkgver.tar.gz")
sha256sums=('867ef0bd196c54daadf480adae7942dda8d3d95a8e440c9c43cc509af36d950d')
package() {
  cd "$srcdir/unrar-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
