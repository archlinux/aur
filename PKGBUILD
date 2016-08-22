# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=1.1
pkgrel=1
pkgdesc="Bash cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("git")
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
install=install.sh
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
