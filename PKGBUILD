# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.7
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('62e7657ca9d68dfcac5927155e1411e416df7d434a2f27e41adc841500989367')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
