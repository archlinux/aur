# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-maxminddb
_name=maxminddb
pkgver=1.3.0
pkgrel=1
pkgdesc="Python MaxMind DB reader extension"
arch=('any')
url="http://maxminddb.readthedocs.org/"
license=('BSD')
groups=()
depends=('libmaxminddb')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$_name-$pkgver.tar.gz::https://github.com/maxmind/MaxMind-DB-Reader-python/archive/v${pkgver}.tar.gz")
md5sums=('0898f34abcb4d09d590d58f628f06264')

package() {
  mv "${srcdir}/MaxMind-DB-Reader-python-${pkgver}" $_name-$pkgver
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
