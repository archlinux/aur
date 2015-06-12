# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=yape
pkgver=0.36.2
pkgrel=1
pkgdesc='Yet another Commodore plus/4 emulator (SDL port)'
arch=('i686' 'x86_64')
url='http://yape.plus4.net'
license='GPL'
depends=('sdl')
source=(http://yape.homeserver.hu/download/yapeSDL-$pkgver.tar.gz)
md5sums=('7a44d45106261d464c78ed8319fe3bd9')

build() {
	make
}

package() {
	install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
