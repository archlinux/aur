# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.3.0
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('1e0108065e17e7c5e625071def7f9a6d80eff345affe0505a3626ac080345dff')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
