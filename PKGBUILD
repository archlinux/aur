# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=docrep
pkgname=python-$_modulename
pkgver=0.2.7
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
sha256sums=('f60083212c812219ee1d97a123c9fa9f718d28bf5ecea9b9446705a0aaa644da')

package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
