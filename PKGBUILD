# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname="space-cli-bin"
_pkgname="space"
pkgver="0.3.10"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('aarch64' 'x86_64')
url='https://deta.space'
license=('MIT')
depends=()
provides=('space')
source_x86_64=("$_pkgname-x86_64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-x86_64.zip")
source_aarch64=("$_pkgname-arm64-linux.zip::https://github.com/deta/space-cli/releases/download/v${pkgver}/space-linux-arm64.zip")
sha256sums_x86_64=('d62d642388d7850d3533ead8d94ffe6f8c5a1f020e2248ae4a78ae15d2fa8b62')
sha256sums_aarch64=('76fcff438de3195793c755a61e7f0b9501518849da27a1ddc5fc9b36680b0ba5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s space "$pkgdir/usr/bin/space"
    install -m755 space "$pkgdir/usr/bin"
}
