# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.5
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('295dfa83fe5629178c481d95c634ab7ac221b1c8759064a4dd0f39076eb1d408')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
