# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.3
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('e8f5d6ca0f58a57ac7c738034e50e74f2ed4ee9c556bc1e0bc449a79bb0ee911')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
