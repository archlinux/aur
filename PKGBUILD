pkgname=webtunnel-client-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Client"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('custom:TorProject')
options=()

source=("client::https://github.com/a15355447898a/webtunnel/releases/download/${pkgver}/client")

sha256sums=('83cde75bc3e61db0e13f2b9ed60e789b054bcd91a812e3efcc79f038987cec38')

package() {
    install -Dm755 "client" "${pkgdir}/usr/bin/webtunnel-client"
}
