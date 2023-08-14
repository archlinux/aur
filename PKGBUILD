# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.4
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('26a49c76219810566221ab7d5880ddb0ccba1ffeee4768c5ae919c4e36094d8a')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
