# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-maiyuan
pkgver=1.20
pkgrel=4
pkgdesc="来自荆南字坊的免费手写字."
arch=("any")
url='https://github.com/maoken-fonts/KNMaiyuan'
license=("OFL-1.1")
provides=("${pkgname%ttf-}")
conflicts=("${pkgname%ttf-}")
source=(
    "${pkgname}-regular-${pkgver}.ttf::https://raw.githubusercontent.com/maoken-fonts/KNMaiyuan/v${pkgver}/fonts/TTF/KNMaiyuan-Regular.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/KNMaiyuan/v${pkgver}/OFL.txt"
)
sha256sums=('94ea78c51086b1ea58c1744784b2335dea2c5ef1c5193b80e02c7d46b8e0283f'
            '0d3aa94d1bf406e867659d976fcb67a46e6ec224f6d9490dade350d537def214')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm444 "${srcdir}/${pkgname}-regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}