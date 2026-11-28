# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.7.11
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('85063c20203a7c1f24c2eaab3b057ae088a849118a1ee7828351785ce195af79')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
