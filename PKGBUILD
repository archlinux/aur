# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=anesthetic
pkgname=python-$_modulename
pkgver=1.0.2
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
sha256sums=('cd2fbcd2bcf31d51da2432f2ebabbbf2771772bf4726cfa060d057b8187e86e2')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
