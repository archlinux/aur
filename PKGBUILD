# Maintainer: INiNiDS
pkgname=aam-cli-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI for AAM (Abstract Alias Mapping) files with TUI editor and LSP"
arch=('x86_64')
url="https://github.com/ininids/aam-cli"
license=('GPL3')
depends=()
source=("aam-linux-amd64::https://github.com/ininids/aam-cli/releases/download/v${pkgver}/aam-linux-amd64")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/aam-linux-amd64" "${pkgdir}/usr/bin/aam"
}
