# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=age-of-war-2
pkgver=2.3
pkgrel=1
pkgdesc="A Strategy War Flash Game"
arch=('x86_64')
url="https://armorgames.com/user/Louissi"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/age-of-war-2.tar.gz')
md5sums=('862cc4c58d46f3a87a61fbca62869dcf')
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
