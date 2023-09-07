# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
