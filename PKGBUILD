# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=0.102
pkgrel=0
arch=(any)
url='https://github.com/lxgw/LxgwMarkerGothic'
license=("custom:SIL OFL")
#provides=()
#conflicts=()
depends=('fontconfig')
makedepends=()

source=("LxgwMarkerGothic-Regular-${pkgver}.ttf::https://github.com/lxgw/LxgwMarkerGothic/releases/download/v${pkgver}/LxgwMarkerGothic-Regular.ttf")

sha256sums=('4c294e80514f37873ead8e7fffc8e3f8afc2296a7b96cb74346bb67da5244a01')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/LxgwMarkerGothic-Regular.ttf"
}

# vim: ts=4 sw=4 et
