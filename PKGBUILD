# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.7.3
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('cd28bc1e12f005c39fdf3c49e6be793206749b0f16db5eed742727b484a027ae')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
