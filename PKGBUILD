# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.4
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('333bf00b5833e6b1faf4506c0e4840188dde41cbeab608b88c5b7d1227303ffc')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
