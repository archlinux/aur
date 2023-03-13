# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal-bin
pkgver="1.2.2"
pkgrel=1
pkgdesc="Quick and easy command-line file transfer utility from any computer to another"
arch=(x86_64 aarch64)
url="https://github.com/ZinoKader/portal"
license=(MIT)
depends=()
makedepends=()
optdepends=()
provides=(portal)
source_x86_64=("https://github.com/ZinoKader/portal/releases/download/v${pkgver}/portal_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/ZinoKader/portal/releases/download/v${pkgver}/portal_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=("e1adf19c09e2d428f509144071acb65d96bc64b0db449a1cd3c342b940b8c117")
sha256sums_aarch64=("a8c080e13503a2b8bbb5f3efb1a1e409ddd821e978ef0c2fee433e8b60f56392")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
