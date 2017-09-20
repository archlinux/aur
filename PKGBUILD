# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=camb
pkgname=python-$_modulename
pkgver=0.1.6.1
pkgrel=2
pkgdesc="Code for Anisotropies in the Microwave Background"
arch=(any)
url="https://github.com/cmbant/CAMB"
license=('http://camb.info/CAMBsubmit.html')
groups=()
depends=('python-numpy' 'gcc-fortran')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('14ab06eb0ff4e9d55285d42ab6a665b3710b1eefe6c361842dd83ffe4e5bc4e2')
package() {
  cd "$srcdir/CAMB-$pkgver/pycamb"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
