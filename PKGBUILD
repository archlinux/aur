# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=dzr
pkgver="240608"
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
sha256sums=("06ab0eb5ee3e42e0304b68107e6c3aad8842df34a41eb069ebaca4535262e1ad")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  cp dzr dzr-dec dzr-url "$pkgdir/usr/bin/"
}
