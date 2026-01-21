pkgname=webtunnel-server-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Server"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('custom:TorProject')
options=()

source=("server::https://github.com/a15355447898a/webtunnel/releases/download/${pkgver}/server")

sha256sums=('2b39773dd552289146ccbfba7942b8d00dc6565aafd420b0852a72be277bd672')

package() {
    install -Dm755 "server" "${pkgdir}/usr/bin/webtunnel-server"
}
