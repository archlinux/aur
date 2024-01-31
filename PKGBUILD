# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-yuanmo
pkgver=0.72
pkgrel=4
pkgdesc="来自荆南字坊的荆南缘默体"
arch=("any")
url="https://github.com/maoken-fonts/KNYuanmo"
license=("OFL-1.1")
conflicts=("${pkgname}")
source=(
    "${pkgname}-regular-${pkgver}.ttf::https://raw.githubusercontent.com/maoken-fonts/KNYuanmo/v${pkgver}/fonts/TTF/KNYuanmo-Regular.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/KNYuanmo/v${pkgver}/OFL.txt"
)
sha256sums=('42b3d600be957985206f0804fcbaceca8e83b18e6b7bfe8341b5ffa7eb4d40d9'
            'fd5c8d67fc570d64114efb5c41415c510169d3627524ceb03fc1013b91f344fe')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/${pkgname}-regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm444 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}