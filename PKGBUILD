# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.7.8
pkgrel=1
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('62aea42c9cba52cd1642b3666ab37019a0ce4c24ab50b07e85dccc8d812f7d61')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
