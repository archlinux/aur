# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=websocat-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line client for WebSockets, like netcat (or curl) for ws:// with advanced socat-like functions"
arch=("x86_64")
url="https://github.com/vi/websocat/"
license=("MIT")
depends=()
optdepends=()
conflicts=("websocat-git")
source=("https://github.com/vi/websocat/releases/download/v${pkgver}/websocat_amd64-linux")
sha256sums=('d8db1afd26e1d79206687ae8afd05d3f0f7da489984cce5959f1dc9a66232c7c')

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm 755 websocat_amd64-linux "${pkgdir}/usr/bin/websocat"
}

# vim:set ts=4 sw=4 et:
