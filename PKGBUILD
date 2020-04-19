# Maintainer: amesgen <amesgen AT amesgen DOT de>
pkgname=ghcup-hs-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="an installer for the general purpose language Haskell"
arch=('x86_64')
url="https://gitlab.haskell.org/haskell/ghcup-hs"
license=('LGPL3')
depends=()
makedepends=()
conflicts=('ghcup-git')
source=(ghcup-$pkgver::https://downloads.haskell.org/~ghcup/$pkgver/x86_64-linux-ghcup-$pkgver)
sha256sums=('78d69ed4c9a810a445af89ea25e4217a632799ecb427b06cd2320ffb574f555e')
install="$pkgname.install"

package() {
  install -Dm755 "$srcdir/ghcup-$pkgver" "$pkgdir/usr/bin/ghcup"
}
