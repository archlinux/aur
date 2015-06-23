# Maintainer: Benoît Taine <ork@olol.eu>
_pypi_module=pgi
pkgname=python-${_pypi_module}
pkgver=0.0.10.1
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
source=("https://pypi.python.org/packages/source/p/pgi/pgi-${pkgver}.tar.gz")
md5sums=(b624bb10f6c84955c6fb03a11867aa30)

package() {
  cd "$srcdir/$_pypi_module-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
