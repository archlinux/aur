# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.3.2
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('dd2dbf4d91a607a87207ffc20ae92370c1b1e22e66688a90f723a11549e8bd69')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
