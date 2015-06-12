# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bsod
pkgver=0.1
pkgrel=4
pkgdesc="Bsod displays the famous windows xp blue screen of death on the console"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/bsod/"
license=('GPL')
depends=('ncurses')
source=("http://www.vanheusden.com/bsod/$pkgname-${pkgver}.tgz")
md5sums=('a8e4a111ef16810e25461322c5bdbc3f')

build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
cd $srcdir/$pkgname-$pkgver
install -D -m755 ./bsod $pkgdir/usr/bin/bsod
}
