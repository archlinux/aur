# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bsod
pkgver=0.1
pkgrel=6
pkgdesc="Bsod displays the famous windows xp blue screen of death on the console"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.vanheusden.com/bsod/"
license=('GPL')
depends=('ncurses')
source=("http://web.archive.org/web/20150802072403/http://vanheusden.com/bsod/${pkgname}-${pkgver}.tgz")
md5sums=('a95770f60bd77eda523f1aa0bfe3d01d')

build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
cd $srcdir/$pkgname-$pkgver
install -D -m755 ./bsod $pkgdir/usr/bin/bsod
}
