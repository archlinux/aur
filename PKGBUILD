# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.4
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('6da1fcb0a64004373c47517f9e072637fb6b697790d8f295d0b423f3dd5d334b')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
