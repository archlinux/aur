# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python2-$_modulename
pkgver=0.3.1
pkgrel=1
pkgdesc="MCMC sample analysis, kernel densities, plotting, and GUI"
arch=(any)
url="https://github.com/cmbant/getdist"
license=()
groups=()
depends=('python2-numpy' 'python2-matplotlib' 'python2-six' 'python2-scipy' 'python2-pyside' 'python2-pandas')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('5d11aeb0773ccc6827fdc20eabddaf32dfd05bc2e7ac76a84f1a5c70249ab576')

package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
