# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.7
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('e9737023c71bc4381f7ced90a197a17a5908c1cf1b136bd381165e07ed50b1ac')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
