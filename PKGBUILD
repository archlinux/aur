# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-lxgw-marker-gothic
pkgname=($pkgbase)
pkgver=1.002
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

sha256sums=('bd4a4d4015f0522481297fd33eee8be4840971bcc389e07e0e8a670d2687dc18')

package_ttf-lxgw-marker-gothic() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="LXGW Marker Gothic / 霞鹜漫黑 An open-source Chinese font derived from Tanugo 一款由 Tanugo 衍生的开源中文字体。"

    install -Dm644 "${srcdir}"/LxgwMarkerGothic-v${pkgver}/fonts/ttf/LXGWMarkerGothic-Regular.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 "${srcdir}"/LxgwMarkerGothic-v${pkgver}/OFL.txt -t "${pkgdir}/usr/share/licenses/"
}

# vim: ts=4 sw=4 et
