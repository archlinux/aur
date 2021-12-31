# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=cobaya
pkgname=python-$_modulename
pkgver=3.1.1
pkgrel=1
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/CobayaSampler/$_modulename"
license=()
groups=()
depends=(python-numpy python-scipy python-pytz python-six python-dateutil python-pandas python-yaml wget python-pybobyqa python-kiwisolver python-pyparsing python-cycler python-matplotlib python-getdist python-fuzzywuzzy python-pyside2)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6b2102d98d0c65c168c73e3d0f662cd16823b66a49f9646c4addaa66b037b344')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
