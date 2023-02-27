# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-xiaowanzi
pkgver=1.0
pkgdesc="仓耳小丸子,任何用户可以全球任何领域永久免费商用."
pkgrel=1
arch=(any)
url='http://tsanger.cn/category/114'
license=(custom)
depends=()
makedepends=()
source=("canger-xiaowanzi.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E5%B0%8F%E4%B8%B8%E5%AD%90.ttf")
sha256sums=('17202a84e3583b493553150ea8d604bbedd3715c2f67abfd62df53b3e9361dd4')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    cp "${srcdir}/canger-xiaowanzi.ttf" "${pkgdir}/usr/share/fonts/canger"
}
