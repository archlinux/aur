# Maintainer: zhullyb <5435486@qq.com>

pkgname=deepin.com.dingtalk.com
pkgver=5.1.9.11
pkgrel=1
install=.INSTALL
pkgdesc="DingTalk Client on Deepin Wine"
arch=('i686' 'x86_64')
url="https://github.com/zhullyb/deepin.com.dingtalk.com"
license=('custom')
depends=('deepin-wine')
source=("https://github.com/zhullyb/deepin.com.dingtalk.com/releases/download/v${pkgver}/deepin.com.dingtalk.com_${pkgver}_i386.deb")
sha256sums=('489c66d72a031f13041ab1f37e9fbd01dea17d54ae0043c77c53e071575793fe')
prepare() {
    bsdtar -xf "$srcdir"/data.tar.xz
}
package() {
    cd "$srcdir"
    mv opt usr "$pkgdir"
}
