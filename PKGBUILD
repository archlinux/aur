# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=dpi-checkers-bin
pkgver=0.6.0
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

sha256sums_x86_64=('532172c556ac0fc8ec15ef5ece71910cbca00224e5eaad349a011ae3fb814587')
sha256sums_aarch64=('20104970dbd3e38fdbc4b70e9fc9d625d32e4dd0c584b63992e98b5b41c474f0')

package() {
    install -Dm755 "${srcdir}/dpich" "${pkgdir}/usr/bin/dpich"
}
