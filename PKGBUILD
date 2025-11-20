# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('a172d50e38f8061c01c0cf51870fed5976fd1cbd55e6108f5098d9724178cee4')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
