# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.2
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('9b28bff59cb27088e96103b062dba8094da4afaa7ee4b28815a5465c6e1b0e3c')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
