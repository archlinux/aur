# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('45131e8b799c46ad58a94fad6bf5e0d508ed56fb016d45a6eade7801b95377de')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
