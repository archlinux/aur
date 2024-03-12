# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.5
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('9d919a55e7a2dbaeab46e777a0589d7e304c71fed011f989143883cbc887e348')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
