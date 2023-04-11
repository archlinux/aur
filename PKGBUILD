# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.0
pkgrel=3
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('3a0de1d60e2f95476f795899de096842c5ebbc8d26413252fe9c8bb03807076d')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/sbin/loki"
}
