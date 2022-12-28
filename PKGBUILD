# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal-bin
pkgver="1.0.6"
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
sha256sums_x86_64=("afaaf60b9fdee96cc4e40cecdc92614826c2382df07e00f1bfe85d22af6cbe65")
sha256sums_aarch64=("13dd9191d235781cb82c5f34f9390ff831a10e8c4a37bfda2994dbd4d5660285")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
