# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=2.4.15
pkgrel=1
pkgdesc="The simplest, zero-cost intranet penetration in the whole network, a single command directly connects any two hosts on the Internet.(Prebuilt version,written in Go)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://gitee.com/konyshe/goodlink"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-cmd.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm-cmd.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-386-cmd.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-cmd.zip")
sha256sums_aarch64=('59121a905c5ccf51a04e94ad36491fae79dfcd608c33e4b2785d4f4a5de86412')
sha256sums_armv7h=('edd7ee85138b0c26070e71bb2a745416ddcf9ba7a01c31ec45a136a6683038cf')
sha256sums_i686=('2ca0dfa6f17c3dabac9fde925b6f51dd229e6cefe068d79e4e885a31d04fe215')
sha256sums_x86_64=('dac6a2a26b7bbcb8696569356fe6860c21f0e068470bd4f6b10e8fff9d411f16')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"*-cmd "${pkgdir}/usr/bin/${pkgname%-bin}"
}
