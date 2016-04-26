# Maintaine: <gmail.com: Jesse Jaara>
# Contributor: Gabriel Laskar <gabriel@lse.epita.fr>

_modulename=pandocfilters
pkgname=python-$_modulename
pkgver=1.3.0
pkgrel=1
pkgdesc="A python module for writing pandoc filters"
arch=(any)
url="https://pypi.python.org/pypi/pandocfilters"
license=('BSD')
depends=('python')
source=(https://pypi.python.org/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz)
md5sums=('3b39f22a53cd14fd49a8963dc5cc524e')

package() {
  cd "$srcdir/${_modulename}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
