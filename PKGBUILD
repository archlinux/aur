# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('3729a680e0e260e24059ca972ee778b232599ae69f1652e579b05fe45c1a8674')
sha256sums_armv7h=('3729a680e0e260e24059ca972ee778b232599ae69f1652e579b05fe45c1a8674')
sha256sums_i686=('b4b5e7646260c41067ea6b304b169b85479a753764cbe73c1551f84f03f6aa64')
sha256sums_x86_64=('bc91fa9feec69e1673a129397ca363a782fa5fee6510daea7b0004d5dc2fd63f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
