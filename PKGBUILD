# Maintainer: levinit <levinit at outlook>

pkgname=wechat_web_devtools
pkgver=1.02.1802080
pkgrel=1
pkgdesc="wechat web devtools 微信web开发工具"
arch=('any')
url="https://github.com/cytle/wechat_web_devtools"
license=('custom')

depends=('wine' 'wine-mono' 'httpie' 'wget')
makedepends=('git' 'wine_gecko')

source=("git://github.com/cytle/wechat_web_devtools")
sha512sums=('SKIP')

install=${pkgname}.install

prepare() {
    cd $srcdir/$pkgname
    rm images -rf
    rm 'package.nw/node_modules/git-utils/deps/libgit2/tests/resources/status/这'
}

package() {
    install -dm755 $pkgdir/opt
    cp -r $srcdir/$pkgname $pkgdir/opt/
}
