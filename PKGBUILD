# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.3
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('3446195c74fc9682a6e6c3b56fcb23c0cafed22f46a7996648d2f22cfe1edda0')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
