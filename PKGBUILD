# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=pybobyqa
pkgname=python-$_modulename
pkgver=1.2
pkgrel=0
pkgdesc="Python-based Derivative-Free Optimization with Bound Constraints"
arch=(any)
url="https://github.com/numericalalgorithmsgroup/$_modulename"
license=()
groups=()
depends=(python-numpy python-scipy python-pandas)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8dc2554a9526cdb2cdf51d1cc3e3ea9ce8755a026cdbda22b87e6542a08f6e12')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
