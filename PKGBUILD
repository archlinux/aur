# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=bloom-defender
pkgver=1.0
pkgrel=3
pkgdesc="Fun Strategy Green Trees Tower Defense Shooting Game"
arch=('x86_64')
url="https://www.kongregate.com/games/ninjakiwi/zombie-trailer-park"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/bloom-defender.tar.gz')
md5sums=('46272103e44f61ea36482dd90d73fe01')
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
