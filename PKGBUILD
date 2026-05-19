# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.11
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('e87959e3d7f32ae3e6a74704d71f5721d51c7558ff42614a7a0c85b5da2a9c9d')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
