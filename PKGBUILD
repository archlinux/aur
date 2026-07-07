pkgname=webtunnel-server-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Pluggable Transport based on HTTP Upgrade(HTTPT) - Server"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel"
license=('custom:TorProject')
options=()

source=("server::https://github.com/a15355447898a/webtunnel/releases/download/${pkgver}/server")

sha256sums=('ed637512e1ed83fd770a9d15fe613cd6e00e9c00225dedd60411e57d8aa196fb')

package() {
  install -Dm755 "server" "${pkgdir}/usr/bin/webtunnel-server"
}
