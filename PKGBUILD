# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.8
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('882c7dffb30a9e1ef6df4ee7c38e5f0fe3a4e20136b98ea89bce478bc4bb3491')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
