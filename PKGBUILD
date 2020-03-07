#Maintainer: laomocode <3344907598@qq.com>
pkgname=firefox-china-extra
_firefoxname=firefox
pkgver=73.0.1
_downpkgver=73.0
pkgrel=1
pkgdesc="Firefox Chinese extensions pack,provides Firefox China sync services,China search,screenshot,tab optimised,address bar QR Code and drag gesture.火狐浏览器的中文包，提供中国版同步、中国的搜索引擎
截图、标签页优化、地址栏里的二维码和拖拽手势"
license=('MPL')
depends=('firefox')
arch=('any')
source=("https://download-ssl.firefox.com.cn/releases/firefox/${_downpkgver}/zh-CN/Firefox-latest-x86_64.tar.bz2")
sha256sums=("89369fd22f38e6027d74dc8d00839bf4b72046a078f593370c097d275c235c52")
package(){
    install -d ${pkgdir}/usr/lib/${_firefoxname}/distribution/
    cp -r ${srcdir}/firefox/distribution/extensions/ ${pkgdir}/usr/lib/${_firefoxname}/distribution/
    cp -r ${srcdir}/firefox/distribution/searchplugins ${pkgdir}/usr/lib/${_firefoxname}/distribution/
}
