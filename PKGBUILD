# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.3
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('c9a1c3e09ea5b703affc892ab3bd5190b0edcf398fddfc19a278ed533de2da6a')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
