# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=anesthetic
pkgname=python-$_modulename
pkgver=1.2.2
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
sha256sums=('98d935d105371d93dc010a296816d3645c40227aa4c36111a89ecaa360635296')
package() {
  cd "$srcdir/$_modulename-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
