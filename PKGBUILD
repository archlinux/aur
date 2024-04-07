# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=dzr
pkgver="240406"
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
sha256sums=("94c1f4a913405bccac760f346f6dd03acf10c7805bf89244c7ba2123df11f416")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  cp dzr dzr-dec dzr-url "$pkgdir/usr/bin/"
}
