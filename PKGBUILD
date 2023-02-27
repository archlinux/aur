# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-feibai
pkgver=1.0
pkgdesc="仓耳非白体,任何用户可以全球任何领域永久免费商用."
pkgrel=1
arch=(any)
url='http://tsanger.cn/category/114'
license=(custom)
depends=()
makedepends=()
source=(
    "canger-feibai-W01.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E9%9D%9E%E7%99%BDW01.ttf"
    "canger-feibai-W02.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E9%9D%9E%E7%99%BDW02.ttf"
    "canger-feibai-W03.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E9%9D%9E%E7%99%BDW03.ttf"
    "canger-feibai-W04.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E9%9D%9E%E7%99%BDW04.ttf"
    "canger-feibai-W05.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E9%9D%9E%E7%99%BDW05.ttf"
    )
sha256sums=('2e7d003f8a65b7a8408a44b22d791636aed36a5d3cf0a6d4e094f27566c88de7'
            '14f5b3f784f0a158ae38774c8088f945cf874b7d1c31aae6ae5b6b25dbc1cc80'
            'e19573dbf308065a451d4ff117207c463475471db33646cc97d43c46700e1a3b'
            '00e4696f70c5e26035e3e87f756c88c9462735e086ab444d98605760fb19d00b'
            '4e5c093e690dffa0cd829c14361fa8c7af0616f16960a0dcd812632d6c192bed')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    cp "${srcdir}/"canger-feibai-*.ttf "${pkgdir}/usr/share/fonts/canger"
}
