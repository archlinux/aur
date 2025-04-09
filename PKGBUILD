# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-bobohei
_pkgname=KNBobohei
pkgver=1.710
pkgrel=2
pkgdesc="来自荆南字坊的免费手写字.Kingnam Bobohei 荆南波波黑"
arch=('any')
url="https://github.com/maoken-fonts/KNBobohei"
license=("OFL-1.1")
provides=("${pkgname%ttf-}")
conflicts=("${pkgname%ttf-}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9845d7377258bd342b0266a4cb440b0fd40b62b6dacbeeb750b1c5e13a391789')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm444 "${srcdir}/${_pkgname}-${pkgver}/fonts/TTF/${_pkgname}-Bold.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-bold.ttf"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}