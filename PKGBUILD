# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-honor-sans
pkgver=1.1
pkgdesc="全新荣耀字体向全社会免费开放下载使用。"
pkgrel=1
arch=(any)
url='https://developer.hihonor.com/cn/doc/guides/100681'
license=(custom)
depends=('fontconfig')
makedepends=()
source=("${pkgname}-${pkgver}.zip::https://contentplatform-drcn.hihonorcdn.com/developerPlatform/HONOR_Sans_${pkgver}/HONOR_Sans_${pkgver}.zip")
sha256sums=('d79555415bed177cf6c1cf611be6d02e1b911e54aabd7e5528d184f31b385fed')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/honorsans"
    cp -rv "${srcdir}/HONOR_Sans_${pkgver}/"HONORSans*/*.ttf "${pkgdir}/usr/share/fonts/honorsans"
}