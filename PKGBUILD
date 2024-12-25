# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="an android OTA payload dumper written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/ssut/payload-dumper-go"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('2512b2a57556f12c24304898363fa9640b8485b6ead3f2184e253c4890fe6de5')
sha256sums_armv7h=('61463a27388041a18b478f9c97671e75afbf19b9a002293038dcc3a40bb5c5cc')
sha256sums_x86_64=('1b973d521cda71268ddbaa0388fe28d6a94b370c58e21352137c5f9077b0bfe7')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}