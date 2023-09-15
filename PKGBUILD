# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('78c6fb79fb6be97cdfa1e164c31d2ea46d89985e5832902e8043ccebb5fd6a99')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
