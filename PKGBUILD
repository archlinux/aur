# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=3.6.8
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
sha256sums_aarch64=('e92ff2b136e642677862cbc853922866cfa1febdc6b60802c27ce2f525caf60b')
sha256sums_armv7h=('60920f0ff2ea9ccf3ac8e1c3bf115183bed43c263a2f6c719058a74ccc7f3c06')
sha256sums_i686=('3d3893d98d34c3d437874709c751faa24ce1b3ef6d958b4c033f1aa2af025f1d')
sha256sums_x86_64=('ce6bd0e071b70743a8b89c973d36a271599af126d1eea5d8a46a815ff1684450')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"* "${pkgdir}/usr/bin/${pkgname%-bin}"
}
