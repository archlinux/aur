# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-zhoukezhengdabangshu
pkgver=1.0
pkgdesc="仓耳周珂正大榜书,任何用户可以全球任何领域永久免费商用."
pkgrel=1
arch=(any)
url='http://tsanger.cn/category/114'
license=(custom)
depends=()
makedepends=()
source=("canger-zhoukezhengdabangshu.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E5%91%A8%E7%8F%82%E6%AD%A3%E5%A4%A7%E6%A6%9C%E4%B9%A6.ttf")
sha256sums=('598e95ff626957ca26c74eae412b14394fcf5062c2cd17453d18cdb69843d695')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    cp "${srcdir}/canger-zhoukezhengdabangshu.ttf" "${pkgdir}/usr/share/fonts/canger"
}
