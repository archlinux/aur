# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=zombies-trailer-park
pkgver=1.0
pkgrel=2
pkgdesc="Manage Your Economy and Train Fighting Units to Defend Your Trailer Park"
arch=('x86_64')
url="https://www.kongregate.com/games/ninjakiwi/zombie-trailer-park"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/zombies-trailer-park.tar.gz')
md5sums=('4a7377c81d8d76b3542410329e87b417')
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
