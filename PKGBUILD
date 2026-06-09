# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=dpi-checkers-bin
pkgver=0.8.0
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

sha256sums_x86_64=('0b43a5af85577b73dbc40ff197426f91a0bcd16b94ce742bc28ac665eb348d2e')
sha256sums_aarch64=('d63dd143a020b920c1d506b0db359baead2541ebcf0557a31b355221ca6f4777')

package() {
    install -Dm755 "${srcdir}/dpich" "${pkgdir}/usr/bin/dpich"
}
