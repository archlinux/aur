# Maintainer: thorko contact@thorko.de
pkgname=loki-bin
pkgver=3.5.1
pkgrel=0
pkgdesc="Loki: like Prometheus, but for logs."
arch=('x86_64')
url='https://github.com/grafana/loki'
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/grafana/loki/releases/download/v${pkgver}/loki-linux-amd64.zip")
sha256sums_x86_64=('08629c54448e33781b7d6bbd03e67b61c82d5d1cc4f9db3cc25da096b734ca21')


package() {
    install -Dm0755 "loki-linux-amd64" "${pkgdir}/usr/bin/loki"
}
