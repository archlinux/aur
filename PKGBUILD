# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-longzhuti
pkgver=1.000
pkgdesc="标小智龙珠体是基于日本著名字体设计公司Fontworks免费开源的摇滚乐 One(日文名：ロックンロール)字体进行简体字补充的一款字体."
pkgrel=1
arch=(any)
url='https://www.maoken.com/dragonball'
_githuburl='https://github.com/maoken-fonts/LongZhuTi'
license=(OFL1.1)
depends=()
makedepends=()
source=("LongZhuTi-Regular.ttf::${_githuburl}/raw/main/fonts/ttf/LongZhuTi-Regular.ttf")
sha256sums=('a7c16e4ec41419981f2a54b35a0ec8f3dba61884b8b8e03721fed179f2088102')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    cp "${srcdir}/LongZhuTi-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF"
}
