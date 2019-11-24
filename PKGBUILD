pkgname=python-logging-tree
pkgver=1.8
pkgrel=1
pkgdesc="Introspect and display the logger tree inside logging"
arch=(any)
url="https://github.com/brandon-rhodes/logging_tree"
license=('custom:PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/l/logging_tree/logging_tree-$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd logging_tree-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
