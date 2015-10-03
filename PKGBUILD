# Maintainer: Jérôme Deuchnord <contact@deuchnord.tk>
pkgname=deuchnord-hermes
pkgver=0.6
pkgrel=1
pkgdesc="A warranties manager"
arch=('i686' 'x86_64')
url="http://www.deuchnord.tk/projets/hermes"
license=('custom:MIT')
depends=('qt5-base' 'sane' 'imagemagick')
makedepends=('qt5-base')
source=("http://www.deuchnord.tk/dl/$pkgname-$pkgver.tar.gz")
md5sums=('eda119d88f4fc4773f6e1e2d60dc5895')

build() {
	make
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/icons $pkgdir/usr/share/applications
	cp deuchnord-hermes $pkgdir/usr/bin
	cp icon-hermes.png $pkgdir/usr/share/icons/deuchnord-hermes.png
	cp deuchnord-hermes.desktop $pkgdir/usr/share/applications
}
