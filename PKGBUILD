# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-kingnam-yuanmo
pkgver=0.72
pkgrel=2
pkgdesc="来自荆南字坊的荆南缘默体"
arch=(any)
url='https://github.com/maoken-fonts/KNYuanmo'
license=(custom:OFL1.1)
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38e7d20e1e9a9736263f6f4d0f5412ca1f3e754aef6697ab6764d8d813f4e205')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/KNYuanmo-${pkgver}/fonts/TTF/KNYuanmo-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm444 "${srcdir}/KNYuanmo-${pkgver}/OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}