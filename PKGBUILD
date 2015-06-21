# Maintainer: Mike Sampson <mike@sambodata.com>
pkgname=python2-calabash
pkgver=0.0.3
pkgrel=1
pkgdesc="Bash-style pipelining syntax for Python generators."
arch=('any')
url="http://pypi.python.org/pypi/calabash"
license=('CUSTOM')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/c/calabash/calabash-0.0.3.tar.gz' 'UNLICENSE')
md5sums=('83480435d2d0dfa6e63ba450540a8d6e'
         '7246f848faa4e9c9fc0ea91122d6e680')

package() {
  cd "$srcdir/calabash-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -d $pkgdir/usr/share/licenses/python2-calabash
  install -m 644 -t $pkgdir/usr/share/licenses/python2-calabash/ $srcdir/UNLICENSE
}

# vim:set ts=2 sw=2 et:
