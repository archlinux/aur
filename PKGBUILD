pkgname=webtunnel-client-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Client"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('custom:TorProject')
options=()

source=("client::https://github.com/a15355447898a/webtunnel/releases/download/${pkgver}/client")

sha256sums=('c62979f415d5026d9dbd774170028f618d946362f4d2afeed845010cd9f8d6dd')

package() {
  install -Dm755 "client" "${pkgdir}/usr/bin/webtunnel-client"
}
