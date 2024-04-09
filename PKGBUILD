# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=logcli-bin
_pkgname=logcli
pkgver=v3.0.0
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=()
provides=("logcli")
url="https://github.com/grafana/loki"
license=('AGPL')
source=("https://github.com/grafana/loki/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('36fd5dc168c7cc0fcf69216885798c7a4e0857543cf25641b3d6af6815d968ef')

package() {
    install -Dm755 ${srcdir}/logcli-linux-amd64 ${pkgdir}/usr/bin/logcli
}
