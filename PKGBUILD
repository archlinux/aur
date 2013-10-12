# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-path
pkgver=4.3
pkgrel=1
pkgdesc='A module wrapper for os.path'
url='https://github.com/jaraco/path.py'
arch=('any')
license=('MIT')
source=("https://pypi.python.org/packages/source/p/path.py/path.py-${pkgver}.zip")

package() {
  cd "$srcdir/path.py-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
sha256sums=('4c6b34610c7164efcfe10ebc0204937ddac9bd2125727575c57662a111eda452')
