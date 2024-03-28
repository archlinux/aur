# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.6
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('4d083365dc2c843de5d836cc836cf49e391eb1174f77a40bfd4a26a74ba3173e')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
