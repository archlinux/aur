# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=mlox
pkgver=1.0
pkgrel=1
pkgdesc="A tool for sorting and analyzing Morrowind plugin load order"
provides=('mlox')
conflicts=('mlox')
arch=(any)
url="https://github.com/mlox/mlox"
license=(MIT)
depends=("python" "python-pyqt5" "python-colorama" "python-appdirs" "python-py7zr")
makedepends=("python")
source=("https://github.com/mlox/mlox/archive/v$pkgver.tar.gz")
sha512sums=('cc09ea87b3f28d3fb47da8cef1f50c4bb5666623a4596e828da94bb95ec497c0e25b75d33d763ad07b7aadd395c267148e5453445d4777e752b4f37b4c47d079')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir
}
