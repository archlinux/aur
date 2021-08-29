# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=stickempires
pkgver=2.29
pkgrel=1
pkgdesc="Play Online as One of The Greatest Empires of Inamorta"
arch=('x86_64')
url="http://www.stickwar.com/"
license=('custom')
depends=('flashplayer-standalone')
source=('https://aya1.top/https://github.com/Brx86/yun/releases/download/2/stickempires.tar.gz')
md5sums=('464509cfa2106488980305922c15ecab')
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
