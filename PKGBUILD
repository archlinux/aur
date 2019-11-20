# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=websocat-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Command-line client for WebSockets, like netcat (or curl) for ws:// with advanced socat-like functions"
arch=("x86_64")
url="https://github.com/vi/websocat/"
license=("MIT")
depends=()
optdepends=()
conflicts=("websocat-git")
source=("https://github.com/vi/websocat/releases/download/v${pkgver}/websocat_amd64-linux")
sha256sums=('e6012aa32b0437681c22b0c0738583b6d68863110159e2e158ccd63e6921c308')

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm 755 websocat_amd64-linux "${pkgdir}/usr/bin/websocat"
}

# vim:set ts=4 sw=4 et:
