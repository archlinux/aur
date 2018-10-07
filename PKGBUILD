# Maintainer: levinit <levinit at outlook>

pkgname=wechat_web_devtools
pkgver=1.02.1809111
pkgrel=1
pkgdesc="wechat web devtools 微信web开发工具"
arch=('any')
url="https://github.com/cytle/wechat_web_devtools"
license=('custom')

depends=('wine' 'wine-mono' 'wget' 'wine_gecko')
#makedepends=('wine_gecko')

source=("https://github.com/cytle/wechat_web_devtools/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

install=${pkgname}.install

package() {
    #rm -rf $srcdir/$pkgname-$pkgver/images
    install -dm755 $pkgdir/opt
    cp -r $srcdir/$pkgname-$pkgver $pkgdir/opt/$pkgname
    echo '软件包较大 请耐心等待 please wait'
}
