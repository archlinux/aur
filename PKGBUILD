# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=0.106
pkgrel=0
arch=(any)
url='https://github.com/lxgw/LxgwMarkerGothic'
license=("custom:SIL OFL")
#provides=()
#conflicts=()
depends=('fontconfig')
makedepends=()

source=("LxgwMarkerGothic-Regular-${pkgver}.ttf::https://github.com/lxgw/LxgwMarkerGothic/releases/download/v${pkgver}/LxgwMarkerGothic-Regular.ttf")

sha256sums=('463fa69f069ff5de0a53e72c336507a89e66e9bfbab6c660febb5b9c3a2e0985')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/LxgwMarkerGothic-Regular.ttf"
}

# vim: ts=4 sw=4 et
