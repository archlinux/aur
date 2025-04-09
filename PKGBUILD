# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-yuanmo
_pkgname=KNYuanmo
pkgver=0.74
pkgrel=2
pkgdesc="来自荆南字坊的荆南缘默体"
arch=('any')
url="https://github.com/maoken-fonts/KNYuanmo"
license=("OFL-1.1")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae042dac23bc2a963864f6445784afe760b2ed0e60abed5331816ef4e6492d0f')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm444 "${srcdir}/${_pkgname}-${pkgver}/fonts/TTF/${_pkgname}-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm444 "${srcdir}/${_pkgname}-${pkgver}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}