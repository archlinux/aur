# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-maiyuan
pkgver=1.20
pkgdesc="来自荆南字坊的免费手写字."
pkgrel=1
arch=(any)
url='https://github.com/maoken-fonts/KNMaiyuan'
license=(OFL1.1)
depends=()
makedepends=()
source=("KNMaiyuan-Regular.ttf::https://github.com/maoken-fonts/KNMaiyuan/raw/main/fonts/TTF/KNMaiyuan-Regular.ttf")
sha256sums=('94ea78c51086b1ea58c1744784b2335dea2c5ef1c5193b80e02c7d46b8e0283f')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    cp "${srcdir}/KNMaiyuan-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF"
}
