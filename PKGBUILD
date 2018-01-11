# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=0.7.0
pkgrel=1
pkgdesc=""
_name=indexed_gzip
arch=('any')
url=""
license=('ZLIB')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('22ca48ee2e506fc849264b9540143c90228e7fdb3875fa122aefe70458b9b13f')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
