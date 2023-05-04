# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.8.2
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('ed5582a8945e7b215932d196f474f812db07cb92db3685c5fbd95300414e0918')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
