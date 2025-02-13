# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor (prior maintainer & submitter): twall <tomwallroth at gmail com>

pkgname="ente-cli-bin"
_pkgname="ente-cli"
pkgver=0.2.3
pkgrel=2
pkgdesc="CLI for ente Photos"
arch=('x86_64')
url="https://github.com/ente-io/ente/tree/main/cli"
_url="https://github.com/ente-io/ente"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=('!strip')
source=("${_url}/releases/download/cli-v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('a4fbd1f5884fadc5f48b2798f1bbb447dff3e42e00de11e293b5e815828e6703')

build() {
    tar xf "ente-cli-v${pkgver}-linux-amd64.tar.gz"
}
package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}

