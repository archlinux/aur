# Maintainer: twall <tomwallroth at gmail com>
pkgname="ente-cli-bin"
pkgver=0.1.12
pkgrel=1
pkgdesc="CLI for ente Photos"
arch=('x86_64')
url="https://github.com/ente-io/ente/releases"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=('!strip')
source=("${url}/download/cli-v${pkgver}/ente-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('2648ccdc79dfae20ac9dd4cf18a2a0fe12ebece18c509f3db317b8e0e5161f79')

build() {
    tar xf "ente-cli-v${pkgver}-linux-amd64.tar.gz"
}
package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}
