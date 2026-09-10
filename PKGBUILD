# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=2.3.0
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
sha256sums_aarch64=('e2d712615d53da797ee929006e41f2df5a7960a5353133db9c150ddaa22ae4e8')
sha256sums_armv7h=('e2d712615d53da797ee929006e41f2df5a7960a5353133db9c150ddaa22ae4e8')
sha256sums_i686=('8ac66dc4cf09953f05f0d48abcf2f383b74554b1a34699c91a430e08950bcc31')
sha256sums_x86_64=('b2a3c725fcb9da175159682f54d6e9149f2905b00d84d155e7efc5d599975ceb')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
