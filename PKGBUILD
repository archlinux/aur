# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=logcli-bin
_pkgname=logcli
pkgver=v2.9.3
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=()
provides=("logcli")
url="https://github.com/grafana/loki"
license=('AGPL')
source=("https://github.com/grafana/loki/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('94d39ffc2c435e9f1c4ed4848f57bdd93f69e4939ee1010317361a53d120a335')

package() {
    install -Dm755 ${srcdir}/logcli-linux-amd64 ${pkgdir}/usr/bin/logcli
}
