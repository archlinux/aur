# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=cobaya
pkgname=python-$_modulename
pkgver=0.129
pkgrel=1
pkgdesc="Code for Bayesian Analysis in Cosmology"
arch=(any)
url="https://github.com/JesusTorrado/$_modulename"
license=()
groups=()
depends=()
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('912a4eb77d02af53882245dbac7d33d1209d8fcba10e66195dfe3120e13874e4')

package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
