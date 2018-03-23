# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=getdist
pkgname=python2-$_modulename
pkgver=0.2.8.4.2
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
sha256sums=('b418dea34a24f49ce5cd8590f5e3119b01f42e54c25b9589b3efca27ed67f1af')

package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
