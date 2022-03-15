# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=logcli-bin
_pkgname=logcli
pkgver=v2.4.2
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=()
provides=("logcli")
url="https://github.com/grafana/loki"
license=('AGPL')
source=("https://github.com/grafana/loki/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('68e5e281b4488ad49303cce972e194fe4e186cd519ed8a14db0c28316ad01e05')

package() {
    install -Dm755 ${srcdir}/logcli-linux-amd64 ${pkgdir}/usr/bin/logcli
}
