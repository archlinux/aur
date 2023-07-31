# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=dzr
pkgver="230730"
pkgrel=1
pkgdesc="Command Line deezer.com Player"
arch=(any)
url="https://github.com/yne/dzr"
license=(Unlicense)
depends=(mpv curl jq dialog openssl)
makedepends=()
optdepends=()
provides=(dzr dzr-dec dzr-url)
source=("https://github.com/yne/dzr/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("8feebabc002a0520b65bc3a6256ad81c4446d5b54d6c8fac71176b9bb9c764cc")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  cp dzr dzr-dec dzr-url "$pkgdir/usr/bin/"
}
