#Maintainer: laomocode <3344907598@qq.com>
pkgname=firefox-china-extra
_firefoxname=firefox
pkgver=68.0.2
_downpkgver=68.0
pkgrel=2
pkgdesc="Firefox Chinese extensions pack,provides Firefox China sync services,China search,screenshot,tab optimised,address bar QR Code and drag gesture.火狐浏览器的中文包，提供中国版同步、中国的搜索引擎
截图、标签页优化、地址栏里的二维码和拖拽手势"
license=('MPL')
depends=('firefox')
arch=('any')
source=("https://download-ssl.firefox.com.cn/releases/firefox/${_downpkgver}/zh-CN/Firefox-latest-x86_64.tar.bz2")
md5sums=('0f002a1530874ae443cfb826735aa447')
package(){
    install -d ${pkgdir}/usr/lib/${_firefoxname}/distribution/
    cp -r ${srcdir}/firefox/distribution/extensions/ ${pkgdir}/usr/lib/${_firefoxname}/distribution/
    cp -r ${srcdir}/firefox/distribution/searchplugins ${pkgdir}/usr/lib/${_firefoxname}/distribution/
}
