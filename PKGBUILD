# Maintainer: S.leduc <sebastien@sleduc.fr>
# Contributor: Shanto <shanto@hotmail.com>

pkgname=python2-ctypes
pkgver=1.0.2
pkgrel=1
pkgdesc="Create and manipulate C data types in Python, call functions in shared libraries"
arch=(any)
url="http://pypi.python.org/pypi/ctypes"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/project/ctypes/ctypes/$pkgver/ctypes-$pkgver.tar.gz")
md5sums=('94ff7aa7f7f71b23bac8a98065d77743')

package() {
  cd "$srcdir/${pkgname/python2-/}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
