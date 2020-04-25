# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=cobaya
pkgname=python-$_modulename
pkgver=2.0.3
pkgrel=1
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/CobayaSampler/$_modulename"
license=()
groups=()
depends=(python-numpy python-pyaml python-pandas python-getdist python-scipy python-imageio python-fuzzywuzzy python-wget python-dateutil python-pytz python-pillow python-enum-compat python-future python-six)
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('77460de9e7c0d7be8e8a2194040fc45844e83456d73dceae594cf0068575b124')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
#check() {
#  cd "$srcdir/$_modulename-${pkgver}"
#  python setup.py test
#}
