# Maintainer: Milo Mirate <mmirate@gmx.com>
_pkgname=Pweave
pkgname=python-pweave
pkgver=0.23
pkgrel=1
pkgdesc="A scientific report generator and literate programming tool for Python."
arch=(any)
url="http://mpastell.com/pweave/"
license=('GPL')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('0bc76bd90f3a0380f3c8975e10544815')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rename P p "$pkgdir/usr/bin/P"*
}

# vim:set ts=2 sw=2 et:
