# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=anesthetic
pkgname=python-$_modulename
pkgver=1.3.3
pkgrel=1
pkgdesc="nested sampling visualisation"
arch=(any)
url="https://github.com/williamjameshandley/anesthetic"
license=('MIT')
groups=()
depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-pandas' 'python-fastkde')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('fd9acebb41f9c83530032eac469fb8745b6c8a6f2f41d2b4c5a3575731e8e177')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
