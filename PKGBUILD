# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=docrep
pkgname=python-$_modulename
pkgver=0.3.1
pkgrel=1
pkgdesc="A Python Module for intelligent reuse of docstrings"
arch=(any)
url="https://github.com/Chilipp/docrep"
license=('GPL')
groups=()
depends=()
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fd2e92b8fb6b5d79211598e3b7c899a40c1dc408212ceaa26ddb32f487f159b9')

package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
