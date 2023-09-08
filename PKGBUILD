# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.0
pkgrel=2
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('467a2bdb2e7003905fff2675e6f9ca10ad41d181f4d81b1a4612aa950f99c123')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
