# Maintainer: thorko contact@thorko.de
pkgname=promtail-bin
pkgver=2.8.0
pkgrel=2
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/promtail-linux-amd64.zip")
sha256sums_x86_64=('0aa8084bae5cf87ee973fb38b30ae4549f5e2d219148e235cccc0fc0e4938657')


package() {
    install -Dm0755 "promtail-linux-amd64" "${pkgdir}/usr/bin/promtail"
}
