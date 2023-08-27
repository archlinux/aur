# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=logcli-bin
_pkgname=logcli
pkgver=v2.8.4
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=()
provides=("logcli")
url="https://github.com/grafana/loki"
license=('AGPL')
source=("https://github.com/grafana/loki/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
sha256sums=('3da841c5032ef300846ddc2f382520c9f97c18f33c99e6b3f6784da36a1ae699')

package() {
    install -Dm755 ${srcdir}/logcli-linux-amd64 ${pkgdir}/usr/bin/logcli
}
