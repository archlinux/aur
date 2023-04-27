# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-maiyuan
pkgver=1.20
pkgrel=2
pkgdesc="来自荆南字坊的免费手写字."
arch=(any)
url='https://github.com/maoken-fonts/KNMaiyuan'
license=("custom:OFL1.1")
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ec857c32a6d7a7d6c3eaa0ad2626484b92079c0c35ece7672fc715d4641c31d')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -Dm444 "${srcdir}/KNMaiyuan-${pkgver}/fonts/TTF/KNMaiyuan-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm444 "${srcdir}/KNMaiyuan-${pkgver}/OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}