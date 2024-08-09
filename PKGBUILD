# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.1.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('d7cf60aa461ccb159952742eb26e5576ec03b048ea59bad72e83989aa1554d9e')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
