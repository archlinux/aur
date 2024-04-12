# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.0.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('6f6cb5cfb1ea9c00794b3928a7af0e448930b2854938f3a18012c707158c4f7a')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
