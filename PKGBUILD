# Maintainer: Daniel YC Lin <dlin.tw at gmail>

pkgname=python2-googl-hg
pkgver=0.2.1
_pkgname=python-googl
pkgrel=1
pkgdesc="Simple python wrapper for the goo.gl api"
arch=('any')
url="https://code.google.com/p/python-googl/"
license=('MIT')
depends=('python2')
makedepends=()

source=("$_pkgname"::hg+http://code.google.com/p/python-googl/)

#pkgver() {
#  cd "$srcdir/$_pkgname"
#  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
#}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  #install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
