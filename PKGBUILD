# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.6.8
pkgrel=2
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('8b3fe25b91cee1206e5e3be25b4b79a9fc2a0ede16698953214519f4fd74a1fc')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
