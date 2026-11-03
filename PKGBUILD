# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=3.4.3
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
sha256sums_aarch64=('61edb7a2ce2e5d4b8233205dc17035dbb4e42f2614c942a1bbe2f19c62aa8826')
sha256sums_armv7h=('f2651eacc21b574b9da5dd9a71938d969629c6e5a3ccd1dd9dcc76629c97fa0d')
sha256sums_i686=('637fe825f1e53dd359d0e2680f08247f72ef5da43f8c285ccae4b46d28210b96')
sha256sums_x86_64=('269c12e7ed5dcfb3d380068c4a2d73260f09765afd1b7cf881b56c28f9cddd6e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
