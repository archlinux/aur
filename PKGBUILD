# Maintainer: zhullyb <5435486@qq.com>

pkgname=deepin.com.dingtalk.com
pkgver=5.1.15.16
pkgrel=1
install=.INSTALL
pkgdesc="DingTalk Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://github.com/zhullyb/deepin.com.dingtalk.com"
license=('custom')
depends=('deepin-wine' 'wqy-microhei')
source=("https://github.com/zhullyb/deepin.com.dingtalk.com/releases/download/v${pkgver}/deepin.com.dingtalk.com_${pkgver}_i386.deb")
md5sums=('54764f0ecceb8ed794814edffd83ece4')
prepare() {
    bsdtar -xf "$srcdir"/data.tar.xz
}
package() {
    cd "$srcdir"
    mv opt usr "$pkgdir"
}
