# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=0.200
pkgrel=0
arch=(any)
url='https://github.com/lxgw/LxgwMarkerGothic'
license=("custom:SIL OFL")
#provides=()
#conflicts=()
depends=('fontconfig')
makedepends=()
groups=(lxgw-font)
source=("LxgwMarkerGothic-Regular-${pkgver}.ttf::${url}/releases/download/v${pkgver}/LxgwMarkerGothic-Regular.ttf")

sha256sums=('5a7a9babea09e3dd12814d487010962c3b3a9b51a538c496bec662d7ab65789c')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/LxgwMarkerGothic-Regular.ttf"
}

# vim: ts=4 sw=4 et
