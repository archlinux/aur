# Maintainer: Benoît Taine <ork@olol.eu>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pypi_module=pgi
pkgname=python-${_pypi_module}
pkgver=0.0.11.2
pkgrel=1
pkgdesc="Pure Python GObject Introspection Bindings. Needed for gi with pypy"
arch=(any)
url="https://pypi.python.org/pypi/pgi"
license=('GPL')
groups=()
depends=('python' 'python-gobject')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/pygobject/pgi#tag=$pkgver")
sha512sums=('SKIP')

package() {
  cd "$srcdir/$_pypi_module"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
