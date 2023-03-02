# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-foundertype-sc-fonts
pkgver=1.0
pkgdesc="FounderType Free Fonts.方正免费字体.方正书宋,方正仿宋,方正楷体,方正黑体."
pkgrel=1
arch=(any)
url='https://github.com/wordshub/free-font'
license=(unknown)
depends=()
makedepends=()
source=(
    "FounderType-ShuSong-SC.ttf::${url}/raw/master/assets/font/%E4%B8%AD%E6%96%87/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E4%B9%A6%E5%AE%8B%E7%AE%80%E4%BD%93.ttf"
    "FounderType-FangSong-SC.ttf::${url}/raw/master/assets/font/%E4%B8%AD%E6%96%87/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E4%BB%BF%E5%AE%8B%E7%AE%80%E4%BD%93.ttf"
    "FounderType-KaiTi-SC.ttf::${url}/raw/master/assets/font/%E4%B8%AD%E6%96%87/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E6%A5%B7%E4%BD%93%E7%AE%80%E4%BD%93.ttf"
    "FounderType-HeiTi-SC.ttf::${url}/raw/master/assets/font/%E4%B8%AD%E6%96%87/%E6%96%B9%E6%AD%A3%E5%AD%97%E4%BD%93%E7%B3%BB%E5%88%97/%E6%96%B9%E6%AD%A3%E9%BB%91%E4%BD%93%E7%AE%80%E4%BD%93.ttf"
)
sha256sums=('b5e4a745d7132abc8bbc482c3c096d30ef4c36fe3260a630fc12cfb16394e675'
            'e7134308aa1638ba13365f83e82cbdd3629b908c39350d47c395e100463f0314'
            '2239b43b9decc6c74b353c2dc41e15f7fdede652148afcae6eb959bb03d82aa2'
            'bd99fe368b31c62e29ee8456c8fdeb86277786a17e8e40be00ecbe5e4fc7c275')
package() {
    export LC_CTYPE="zh_CN.UTF-8"   
    install -dm755 "${pkgdir}/usr/share/fonts/FounderType"
    cp "${srcdir}"/*.ttf "${pkgdir}/usr/share/fonts/FounderType"
}
