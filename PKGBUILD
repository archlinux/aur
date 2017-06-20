# Maintainer: Eray Aydın <eray@labkod.com>
pkgname=xgraphic
pkgver=0.1.0
pkgrel=1
pkgdesc="Switch between nvidia and bumblebee"
arch=('i686' 'x86_64')
url="https://github.com/erayaydin/xgraphic"
license=('MIT')
depends=('python')
install=
source=("git+https://github.com/erayaydin/xgraphic.git")
md5sums=('SKIP')
options=('!makeflags' '!emptydirs')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
