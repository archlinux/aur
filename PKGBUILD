# Maintainer: Bryce Allen <bdallen@uchicago.edu>
pkgname=python-hatchet
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python library for analyzing hierarchical performance data"
arch=(any)
url="https://github.com/LLNL/hatchet"
license=('MIT')
depends=('python' 'python-numpy' 'python-pandas')
makedepends=('python-setuptools')
provides=('python-hatchet')
conflicts=('python-hatchet')
source=("https://files.pythonhosted.org/packages/fc/69/4096a7804d59906fe7740d297a88252ac92fbd5e8168dc05e12c9f8eb490/hatchet-$pkgver.tar.gz")
md5sums=('07bbf1ad42c76f289ffa335e98620381')

package() {
  cd "$srcdir/hatchet-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 || exit 1
}
