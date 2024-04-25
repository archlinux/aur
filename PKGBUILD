# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=dads-me
pkgver=1.1
pkgrel=2
pkgdesc="A Classic Flash Game with Fantastic Combo System"
arch=('x86_64')
url="https://www.newgrounds.com/portal/view/254456"
license=('custom')
depends=('flashplayer-standalone')
source=('https://github.com/Brx86/yun/releases/download/2/dads-me.tar.gz')
md5sums=('903b34f68f89d0c361302f501b2cca5e')
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
