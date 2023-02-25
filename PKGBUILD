# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal-bin
pkgver="1.2.1"
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
sha256sums_x86_64=("41ca1a44f2b6aaa6533ef0714d8f4836be0b655263d9365f195b756e98fbffc5")
sha256sums_aarch64=("349c3599772b1627afda41737030c2b1581b3b4f7e38df5c63b4b6af02677627")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
