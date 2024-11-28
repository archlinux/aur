# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor (prior maintainer & submitter): twall <tomwallroth at gmail com>

pkgname="ente-cli-bin"
_pkgname="ente-cli"
pkgver=0.2.2
pkgrel=1
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
sha256sums=('034a070c7d71c51859d133efcaba3860c272be1392872d8c700fd8fadbcc4387')

build() {
    tar xf "ente-cli-v${pkgver}-linux-amd64.tar.gz"
}
package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}

