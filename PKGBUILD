# Maintainer: Gabriel Laskar <gabriel@lse.epita.fr>
_modulename=pandocfilters
pkgname=python-$_modulename
pkgver=1.2.4
pkgrel=1
pkgdesc="A python module for writing pandoc filters"
arch=(any)
url="https://pypi.python.org/pypi/pandocfilters"
license=('BSD')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz)
md5sums=('2ed8c06cda706a12b0dd48b7593bebc4')

package() {
  cd "$srcdir/${_modulename}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
