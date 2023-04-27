# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-foundertype-sc-fonts
pkgver=1.0
pkgdesc="FounderType Free Fonts.方正免费字体.方正书宋,方正仿宋,方正楷体,方正黑体."
pkgrel=3
arch=(any)
url='https://github.com/wordshub/free-font'
_myurl="https://github.com/zxp19821005/My_AUR_Files"
license=(unknown)
depends=()
makedepends=()
source=(
    "FounderType-ShuSong-SC.ttf::${_myurl}/raw/main/ttf-foundertype-sc-fonts/FounderType-ShuSong-SC.ttf"
    "FounderType-FangSong-SC.ttf::${_myurl}/raw/main/ttf-foundertype-sc-fonts/FounderType-FangSong-SC.ttf"
    "FounderType-KaiTi-SC.ttf::${_myurl}/raw/main/ttf-foundertype-sc-fonts/FounderType-KaiTi-SC.ttf"
    "FounderType-HeiTi-SC.ttf::${_myurl}/raw/main/ttf-foundertype-sc-fonts/FounderType-HeiTi-SC.ttf"
)
sha256sums=('b5e4a745d7132abc8bbc482c3c096d30ef4c36fe3260a630fc12cfb16394e675'
            'e7134308aa1638ba13365f83e82cbdd3629b908c39350d47c395e100463f0314'
            '2239b43b9decc6c74b353c2dc41e15f7fdede652148afcae6eb959bb03d82aa2'
            'bd99fe368b31c62e29ee8456c8fdeb86277786a17e8e40be00ecbe5e4fc7c275')
package() {
    export LC_CTYPE="zh_CN.UTF-8"  
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/FounderType"
}