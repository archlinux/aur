# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.6
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('7ed1f314106680eb79601ef701b0aa6ac562d93486a2e6eb3aa04f2a78d193d2')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
