# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=dads-me
pkgver=1.0
pkgrel=2
pkgdesc="A Classic Flash Game with Fantastic Combo System"
arch=('x86_64')
url="https://www.newgrounds.com/portal/view/254456"
license=('custom')
depends=('flashplayer-standalone')
source=('https://aya1.xyz/https://github.com/Brx86/yun/releases/download/2/dads-me.tar.gz')
md5sums=('a419153f28e03dd1daf6b2fd019b4403')
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
