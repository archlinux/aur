# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=dpi-checkers-bin
pkgver=0.11.0
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

sha256sums_x86_64=('60d1b99326805b5173ab7d97d4e3dde1a86ec96cea02789f5a5e305775ad3732')
sha256sums_aarch64=('243f94f4807454e96c5dd96010933c61638f12e7834a3e25f93548f0e8b57127')

package() {
    install -Dm755 "${srcdir}/dpich" "${pkgdir}/usr/bin/dpich"
}
