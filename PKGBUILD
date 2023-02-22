# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal-bin
pkgver="1.1.2"
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
sha256sums_x86_64=("8ed2dc2c2c81dbd17c3ca3325ec1cefac5830dcde63e03f01206385b9ecb5aa3")
sha256sums_aarch64=("9fa7ff5a03a68d26f6fca5ea0210cd112d43b13bf464169cfc7184d249858709")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
