# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=logcli-bin
_pkgname=logcli
pkgver=v2.1.0
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=()
provides=("logcli")
url="https://github.com/grafana/loki"
license=('Apache')
source=("https://github.com/grafana/loki/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('7b53137cf64b9476ede8655d776c91dc8e35a3147f6f24ae50f5182fe06a1583')

package() {
    install -Dm755 ${srcdir}/logcli-linux-amd64 ${pkgdir}/usr/bin/logcli
}
