# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.1.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('bbcc58f0895e6119ba9c6ee41e44b1cf19186db4e920256462dc062c6a7bc632')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
