# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('ef027d63a625d5b74e917b72ae832f187f151e486de15f0515d6af1d6a56aa70')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
