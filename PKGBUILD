# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=commando2
pkgver=2.0
pkgrel=1
pkgdesc="A Flash Game Similar to Metal Slug"
arch=('x86_64')
url="https://www.miniclip.com/games/commando-2"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/commando2.tar.gz')
md5sums=('f91396621ce6ed34e10965aabc8250da')
noextract=()

prepare() {
    mkdir "$pkgname-$pkgver"
    cp -r opt "$pkgname-$pkgver"/opt
    cp -r usr "$pkgname-$pkgver"/usr
}

package() {
    cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
