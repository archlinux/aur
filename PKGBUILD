# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=anesthetic
pkgname=python-$_modulename
pkgver=1.2.6
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
sha256sums=('5cf7b03ef8c471483173b0c7acd4a6ca4ac0eab69363e307298ee4ce44d98572')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
