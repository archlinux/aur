# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-path
pkgver=5.1
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
sha256sums=('976b1392527c77383eb827de7fd44dacaf1297a63aa0df526f47af302f479d54')
