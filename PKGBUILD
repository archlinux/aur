# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.2.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('4f2465fdf2065ad71688f3c5c6dcad7a527f1f6e13b9f55735c0cabc6507fbcd')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
