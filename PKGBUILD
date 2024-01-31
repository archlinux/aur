# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-longzhuti
pkgver=1.000
pkgrel=4
pkgdesc="标小智龙珠体是基于日本著名字体设计公司Fontworks免费开源的摇滚乐 One(日文名：ロックンロール)字体进行简体字补充的一款字体."
arch=("any")
url="https://www.maoken.com/dragonball"
_githuburl='https://github.com/maoken-fonts/LongZhuTi'
license=("OFL-1.1")
conflicts=("${pkgname}")
source=(
    "${pkgname}-regular-${pkgver}.ttf::https://raw.githubusercontent.com/maoken-fonts/LongZhuTi/v${pkgver}/fonts/ttf/LongZhuTi-Regular.ttf"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/maoken-fonts/LongZhuTi/v${pkgver}/OFL.txt"
)
sha256sums=('a7c16e4ec41419981f2a54b35a0ec8f3dba61884b8b8e03721fed179f2088102'
            'ffa9b3b3903dc0904dde70e3023124b8b73acfd268ba2189a300a29cb5734057')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/${pkgname}-regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}-regular.ttf"
    install -Dm444 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}