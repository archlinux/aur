# Maintainer: Sameer Singh <lumarzeli30@gmail.com>
_pypi_module=pgi
pkgname=python-${_pypi_module}
pkgver=0.0.11.2
pkgrel=1
pkgdesc="Pure Python GObject Introspection Bindings. Needed for gi with pypy"
arch=(any)
url="https://pypi.python.org/pypi/pgi"
license=('LGPL')
groups=()
depends=('python' 'python-gobject')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/pgi/pgi-${pkgver}.tar.gz")
md5sums=(4d9f90d8dd14030fc7abc73e8158a2d9)

package() {
  cd "$srcdir/$_pypi_module-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
