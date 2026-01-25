# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.4
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('51504261aebb494577698b0fd4c2ebc62138579d0c7b39f70281c9c4edff7394')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
