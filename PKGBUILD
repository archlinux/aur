# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.2.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('cefbb59a6f45a26aa32529af63facd07c85d7bc5bb2eaa0b04a476b5aa0f2305')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
