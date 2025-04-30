# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=2.1.7
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
sha256sums_aarch64=('c67ee6074a27aeebcffbfa2e6e8df2e0e9c246749aaa770d79a92da8a493ebd0')
sha256sums_armv7h=('88ce0531a9682c0a181ab2fd260a79d289f8d466a515968eadb87bbb0e2f2415')
sha256sums_i686=('9758f8984ae62576639448589a8966018c29ed30cd22e5124f2331793c4dc581')
sha256sums_x86_64=('dae81ff8478dfbf226d8232e13f67109bd9a1a0dcc38b0354521a4a504f49971')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"*-cmd "${pkgdir}/usr/bin/${pkgname%-bin}"
}