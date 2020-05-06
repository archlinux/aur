#Maintainer: laomocode <3344907598@qq.com>
pkgname=firefox-china-extra-extensions-china-newtab
pkgver=4.76
_downpkgver=76.0
_firefoxname=firefox
pkgrel=1
pkgdesc="火狐中国版浏览器的“火狐新标签页”插件"
license=('MPL')
depends=('firefox')
arch=('any')
conflicts=('firefox-chinese' 'firefox-china-extra')
source=("https://download-ssl.firefox.com.cn/releases/firefox/${_downpkgver}/zh-CN/Firefox-latest-x86_64.tar.bz2")
sha256sums=("1d04be8864266bcddf0d8312e5dfaf84f5a15ba7424e2b619940e80d1326467c")
package(){
    mkdir -p ${pkgdir}/usr/lib/${_firefoxname}/distribution/extensions/
    cp ${srcdir}/firefox/distribution/extensions/china-newtab@mozillaonline.com.xpi ${pkgdir}/usr/lib/${_firefoxname}/distribution/extensions/china-newtab@mozillaonline.com.xpi
}
