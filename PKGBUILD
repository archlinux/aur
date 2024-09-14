# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=dzr
pkgver="240909"
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
sha256sums=("8f400de9b2cfc7de87b72354db264abd79beb66734c80ac2cc69b5d49d0e39bd")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  cp dzr dzr-dec dzr-url "$pkgdir/usr/bin/"
}
