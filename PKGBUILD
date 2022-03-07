# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal
pkgver=1.0.3
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
sha256sums_x86_64=("20a22b220efa9d9f26321ba3276856bbe82eb54c91939e7989036da5c6e694df")
sha256sums_aarch64=("40a0c0b9daf18f6e7c0fe794dfda2aef4b41cf52fa1843254cc1d34efddfc40f")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
