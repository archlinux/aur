# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=1.1
pkgrel=1
pkgdesc="Bash cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$url/archive/$pkgver.tar.gz")
install=install.sh
sha256sums=('d97326de1ac44186de0243f2755f44ca037b488acba669c967df4404df11d39e')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
