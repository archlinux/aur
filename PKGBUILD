# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.7.10
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('200e74f7e631969bd0f2a066a2e1d33cdea9b3c0801aaaa7d78947c4ac29bddb')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
