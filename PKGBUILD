#Maintainer: laomocode <3344907598@qq.com>
pkgname=firefox-china-extra-searchplugins-amazondotcn
pkgver=1.0
_downpkgver=73.0
_firefoxname=firefox
pkgrel=1
pkgdesc="火狐中国版浏览器的亚马逊搜索增强"
license=('MPL')
depends=('firefox')
arch=('any')
conflicts=('firefox-chinese' 'firefox-china-extra')
source=("https://download-ssl.firefox.com.cn/releases/firefox/${_downpkgver}/zh-CN/Firefox-latest-x86_64.tar.bz2")
sha256sums=("89369fd22f38e6027d74dc8d00839bf4b72046a078f593370c097d275c235c52")
package(){
    mkdir -p ${pkgdir}/usr/lib/${_firefoxname}/distribution/searchplugins/locale/zh-CN/
    cp ${srcdir}/firefox/distribution/searchplugins/locale/zh-CN/amazondotcn.xml ${pkgdir}/usr/lib/${_firefoxname}/distribution/searchplugins/locale/zh-CN/amazondotcn.xml
}
