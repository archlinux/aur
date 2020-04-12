# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>

pkgname=wifi2qr-git
pkgver=13.c84e73c
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('GPL3')
depends=('networkmanager' 'bash' 'qrencode')
makedepends=()
optdepends=()
provides=('wifi2qr')
conflicts=('wifi2qr')
source=("$pkgname::git://github.com/dlenski/wifi2qr.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 "wifi2qr" "$pkgdir/usr/bin/wifi2qr"
}
