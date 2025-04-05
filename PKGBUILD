# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.4.3
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('e5f42bbdc07ac1e37732264b97f4fa20877e7c18371dc260b1cda34ab1c3ae19')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
