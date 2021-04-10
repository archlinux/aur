# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=stickwar2
pkgver=1.0
pkgrel=1
pkgdesc="The Epic Sequel to the hit Strategy Game Stick War"
arch=('x86_64')
url="http://www.stickwar.com/"
license=('custom')
depends=('flashplayer-standalone')
source=('https://aya1.xyz/https://github.com/Brx86/yun/releases/download/2/stickwar2.tar.gz')
md5sums=('ac204a097d857a3f666a89f097180e87')
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
