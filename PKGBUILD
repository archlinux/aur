# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-longzhuti
pkgver=1.000
pkgrel=2
pkgdesc="标小智龙珠体是基于日本著名字体设计公司Fontworks免费开源的摇滚乐 One(日文名：ロックンロール)字体进行简体字补充的一款字体."
arch=(any)
url='https://www.maoken.com/dragonball'
_githuburl='https://github.com/maoken-fonts/LongZhuTi'
license=(custom::OFL1.1)
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('faf06a5381b9ec1af0ddea4cf937e06044c757eae7224819383371235cdccc73')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -Dm444 "${srcdir}/LongZhuTi-${pkgver}/fonts/ttf/LongZhuTi-Regular.ttf" -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm444 "${srcdir}/LongZhuTi-${pkgver}/"OFL*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}