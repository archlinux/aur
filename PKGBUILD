# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_pkgtype:=-bin}

pkgname="unlock-music-cli$_pkgtype"
pkgver=0.2.19
pkgrel=1
pkgdesc="Unlock Music Project - CLI Edition"
arch=("aarch64" "x86_64")
license=('MIT')
url="https://git.um-react.app/um/cli"

source_aarch64=(
  "um-linux-arm64-v$pkgver.tar.gz::$url/releases/download/v$pkgver/um-linux-arm64-v$pkgver.tar.gz"
)
source_x86_64=(
  "um-linux-amd64-v$pkgver.tar.gz::$url/releases/download/v$pkgver/um-linux-amd64-v$pkgver.tar.gz"
)

sha256sums_aarch64=('8b1cc0edeca17d51a3700b2f69f67cbd40465b23f9bb568361953e67c06d97c5')
sha256sums_x86_64=('0289145c703da2cd737f8dbcfb0ab36a19509b60f2e8c8778a06325576f6ab9c')

package() {

  install -Dm755 "$srcdir/um" -t "$pkgdir/usr/bin/"

}
