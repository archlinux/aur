# Maintainer: Milo Mirate <mmirate@gmx.com>
_pkgname=Pweave
pkgname=python2-pweave
pkgver=0.21.2
pkgrel=1
pkgdesc="A scientific report generator and literate programming tool for Python."
arch=(any)
url="http://mpastell.com/pweave/"
license=('GPL')
groups=()
depends=('python2')
makedepends=('python2-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('a723d17ea3d4247700000f59f7852306')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rename P p "$pkgdir/usr/bin/P"*
}

# vim:set ts=2 sw=2 et:
