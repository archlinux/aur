# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=pybobyqa
pkgname=python-$_modulename
pkgver=1.3
pkgrel=1
pkgdesc="Python-based Derivative-Free Optimization with Bound Constraints"
arch=(any)
url="https://github.com/numericalalgorithmsgroup/$_modulename"
license=()
groups=()
depends=(python-numpy python-scipy python-pandas)
makedepends=(python-setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('16d8a86e7f9efcf38c6b3ad19d64091dbb201ac1a8d06ad66e28489e5cb3aa97')
package() {
  cd "$srcdir/$_modulename-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
