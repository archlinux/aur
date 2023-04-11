# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/promtail-linux-amd64.zip")
sha256sums_x86_64=('ff5b819e66706d2b7d5fc3ef425179e8364650093835e8819a90ad828b6d2043')


package() {
    install -Dm0755 "promtail-linux-amd64" "${pkgdir}/usr/bin/promtail"
}
