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
md5sums=('5bb5924bd40d51471ff9db78da877ace')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
