# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=1.003
pkgrel=1
arch=(any)
url='https://github.com/lxgw/LxgwMarkerGothic'
license=("OFL-1.0 AND LicenseRef-SIL")
#provides=()
#conflicts=()
depends=('fontconfig')
makedepends=()
groups=(lxgw-font)
source=("LxgwMarkerGothic-v${pkgver}.zip::${url}/releases/download/v${pkgver}/LxgwMarkerGothic-v${pkgver}.zip")

sha256sums=('858f40c1b0a4c62a2949a13a071bfbc0075a096ab84b85a3f783688547f57444')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-v${pkgver}/fonts/ttf/LXGWMarkerGothic-Regular.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 "${srcdir}"/LxgwMarkerGothic-v${pkgver}/OFL.txt -t "${pkgdir}/usr/share/licenses/"
}

# vim: ts=4 sw=4 et
