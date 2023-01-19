# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=portal-bin
pkgver="1.0.7"
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
sha256sums_x86_64=("705211ddeaa927f265cdbcbb1e6c805c93baae42e0c4a2928eab2b86f909fec9")
sha256sums_aarch64=("a724a2413708ea01b20872cef9ac90c2fb3593d1cc1a49787f23d189eca1b007")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp portal "$pkgdir/usr/bin/"
}
