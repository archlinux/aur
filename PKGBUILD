# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.5
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('eefea8fd3701f2aae77ee7130be10973d51a33d9fa942075b8cefbf7f930868b')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
