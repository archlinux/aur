# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=dzr
pkgver=220222
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
sha256sums=("4fe0ddd8d38518843568c435417439dc29e3ac672450c1dbd84fb8de5847344f")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  cp dzr dzr-dec dzr-url "$pkgdir/usr/bin/"
}
