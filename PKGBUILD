# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.4.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('f73c73b0de655cb8c7eb1230c6e1054dddb6888922e6b54105d2bf87272d3c79')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
