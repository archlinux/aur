# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=fastkde
pkgname=python-$_modulename
pkgver=1.0.16
pkgrel=1
pkgdesc="Fast kernel density estimation"
arch=(any)
url="https://bitbucket.org/lbl-cascade/fastkde"
license=()
groups=()
depends=('python-numpy' 'python-scipy' 'cython')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/get/v${pkgver}.tar.gz")
sha256sums=('3ed7043573766ce2e71b091541c9d41690c4758f95c12cf7bd4fabfb6a991050')
package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
