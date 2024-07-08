# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-yuanmo
pkgver=0.74
pkgrel=1
pkgdesc="来自荆南字坊的荆南缘默体"
arch=("any")
url="https://github.com/maoken-fonts/KNYuanmo"
license=("OFL-1.1")
conflicts=("${pkgname}")
source=(
    "${pkgname}-regular-${pkgver}.ttf::${url}/releases/download/v${pkgver}/KNYuanmo-Regular.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/KNYuanmo/v${pkgver}/OFL.txt"
)
sha256sums=('ee3c6f2e4eafd5caf4f8f8a5b20996795984834887a0586797719360a90a5cdb'
            '7950ba5b48b5d660e65ee3df5f53fe32bc77397a68cba001c3d414e546a4b3ab')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/${pkgname}-regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm444 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}