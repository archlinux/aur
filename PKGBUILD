# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.3
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('5da0394082e7399e88b6de2a35748531cf31fa938559346e3887b4fdb296a79e')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
