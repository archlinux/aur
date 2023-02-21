# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=0.010
pkgrel=0
arch=(any)
url='https://github.com/lxgw/LxgwMarkerGothic'
license=("custom:SIL OFL")
#provides=()
#conflicts=()
depends=('fontconfig')
makedepends=()

source=("LxgwMarkerGothic-Regular-${pkgver}.ttf::https://github.com/lxgw/LxgwMarkerGothic/releases/download/v${pkgver}/LxgwMarkerGothic-Regular.ttf")

sha256sums=('416c94a094550c4ceb9e0fbd17c7a8b55c5055cfd587fdec44445cd9acf6c149')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/LxgwMarkerGothic-Regular.ttf"
}

# vim: ts=4 sw=4 et
