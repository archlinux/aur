# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>

pkgname=wwdumpsnd
pkgver=0.4
pkgrel=2
pkgdesc='Dump audio from GameCube games.'
url='www.hcs64.com/vgm_ripping.html'
arch=('x86_64')
license=('GPL2')
depends=('glibc')
source=("http://www.hcs64.com/files/wwdumpsnd${pkgver//./}.zip")
b2sums=('189e5c7e0ca2a6a564b14bd163d675e30d265c08931974e88a3ebc45afc43159375a949d35ec1d310ec58dc8a47341647549b2bb6324a7330fcc13ed7c0d978a')

build() {
	gcc wwdumpsnd.c -o wwdumpsnd
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
}
