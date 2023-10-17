# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=2.9.2
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('759d0dcbe9edb8688cdb0052a7a6d7440782dcaae860e8c6ea428eeac39ae05f')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
