# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=websocat-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line client for WebSockets, like netcat (or curl) for ws:// with advanced socat-like functions"
arch=("x86_64")
url="https://github.com/vi/websocat/"
license=("MIT")
depends=()
optdepends=()
conflicts=("websocat-git")
source=("https://github.com/vi/websocat/releases/download/v${pkgver}/websocat_amd64-linux")
sha256sums=('0c537869b885df28fe458b0db6738e3f07fb848865447fd1bacc41cdd717d4dd')

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm 755 websocat_amd64-linux "${pkgdir}/usr/bin/websocat"
}

# vim:set ts=4 sw=4 et:
