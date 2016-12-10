# Maintaine: <gmail.com: Jesse Jaara>
# Contributor: Gabriel Laskar <gabriel@lse.epita.fr>

_modulename=pandocfilters
pkgname=python-$_modulename
pkgver=1.4.1
pkgrel=1
pkgdesc="A python module for writing pandoc filters"
arch=(any)
url="https://pypi.python.org/pypi/pandocfilters"
license=('BSD')
depends=('python')
source=(https://pypi.io/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz)
md5sums=('7680d9f9ec07397dd17f380ee3818b9d')

package() {
  cd "$srcdir/${_modulename}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
