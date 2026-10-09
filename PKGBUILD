# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=dpi-checkers-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Checkers to test your internet provider for censorship"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperion-cs/dpi-checkers"
license=('Apache-2.0')
provides=('dpi-checkers')
conflicts=('dpi-checkers')
options=('!strip')

source_x86_64=("https://github.com/hyperion-cs/dpi-checkers/releases/download/dpich-v${pkgver}/dpich-v${pkgver}-linux-amd64.zip")
source_aarch64=("https://github.com/hyperion-cs/dpi-checkers/releases/download/dpich-v${pkgver}/dpich-v${pkgver}-linux-arm64.zip")

sha256sums_x86_64=('797e27a10f871b8b7c9b6a06d614481f82cbc6757143353bd4355427fbcf977b')
sha256sums_aarch64=('3ececd1538e336bde577b4cc672436dbe3047a771dbc7f190d763cf07e00652c')

package() {
    install -Dm755 "${srcdir}/dpich" "${pkgdir}/usr/bin/dpich"
}
