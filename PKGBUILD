# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=holoviews
pkgname=python-$_pkgname
pkgver=1.6.2
pkgrel=1
pkgdesc="Data visualization via annotation"
arch=("any")
url="https://ioam.github.io/holoviews"
license=('BSD')
depends=('python-numpy' 'python-param')
options=(!emptydirs)
source=("https://pypi.python.org/packages/d5/9c/d4617468008aa576462d69391a20ce67a95455cd40091915e0f5bfbc878a/holoviews-1.6.2.tar.gz")
md5sums=('4bf2413cb9c14b732e268d4c3d84b2a0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
