#Maintainer: laomocode <3344907598@qq.com>
pkgname=firefox-china-extra-extensions-cpmanager
pkgver=4.75
_downpkgver=75.0
_firefoxname=firefox
pkgrel=1
pkgdesc="火狐中国版浏览器的“附加组件管理器”插件，火狐中国版账户的核心插件。"
license=('MPL')
depends=('firefox')
arch=('any')
source=("https://download-ssl.firefox.com.cn/releases/firefox/${_downpkgver}/zh-CN/Firefox-latest-x86_64.tar.bz2")
conflicts=('firefox-chinese' 'firefox-china-extra')
sha256sums=("1e292b8d365142d917daa8ff9046e9bfc3fdb48a516f402d221564ec307359a6")
package(){
    mkdir -p ${pkgdir}/usr/lib/${_firefoxname}/distribution/extensions/
    cp ${srcdir}/firefox/distribution/extensions/cpmanager@mozillaonline.com.xpi ${pkgdir}/usr/lib/${_firefoxname}/distribution/extensions/cpmanager@mozillaonline.com.xpi
}
