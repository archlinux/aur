# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=3.7.0
pkgrel=1
pkgdesc="The simplest, zero-cost intranet penetration in the whole network, a single command directly connects any two hosts on the Internet."
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.zip")
sha256sums_aarch64=('e015021762ed71621970ea7c2f7847cee8a2f0d900ff33e25d0b49317f2f8b13')
sha256sums_armv7h=('8ace2ebdc13b25ed710833545d919daf0cc05109cec4bd9af730ab340f76a5f5')
sha256sums_i686=('a303e86ba862fb0109d7bf4619dbffc9c7644ac30122bf5c937185a9b7568b02')
sha256sums_x86_64=('71d2806323213e91f944d5ad5e08dc3aa1cb28644972cb07b99da90722bf706d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
