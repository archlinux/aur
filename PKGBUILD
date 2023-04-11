# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.0
pkgrel=2
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('1e909692cdae344ed73528a4d9e9f8402d052e7edba0ae40ada5f7b8426c72bc')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/sbin/loki"
}
