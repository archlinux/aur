# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=cobaya
pkgname=python-$_modulename
pkgver=3.0
pkgrel=0
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
sha256sums=('67cc6f57d59748b19d1299299b4cd58a0d7cc9a41055c15a6bba202b2267b2bd')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
