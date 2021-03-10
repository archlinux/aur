# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=websocat-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Command-line client for WebSockets, like netcat (or curl) for ws:// with advanced socat-like functions"
arch=("x86_64")
url="https://github.com/vi/websocat/"
license=("MIT")
depends=()
optdepends=()
conflicts=("websocat-git" "websocat")
provide=("websocat")
source=("https://github.com/vi/websocat/releases/download/v${pkgver}/websocat_amd64-linux")
sha256sums=('cec0d7d05252dcadb09a5afb8851cf9f3a8997bba44334eee5f7db70ca72aa0b')

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm 755 websocat_amd64-linux "${pkgdir}/usr/bin/websocat"
}

# vim:set ts=4 sw=4 et:
