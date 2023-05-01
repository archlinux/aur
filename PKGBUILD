# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('a1c70da88ef65ef2caafd00001f15a774166ec9bf580f7d714ee167c43525e43')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
