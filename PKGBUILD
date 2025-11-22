# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('f8bd4d1011ca3e75a8ced7122f1b7d5bc4c9ecbcee188949bcb95ab73a9b24b0')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
