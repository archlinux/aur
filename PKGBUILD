# Maintiner: Victor DENIS <victordenis01@gmail.com>
# Contributor: 
pkgbase=sielo-navigateur
pkgname=sielo-navigateur
pkgver=0.2.2
pkgrel=2
pkgdesc="A fast web browser made in C++14 with Qt5.7"
arch=(x86_64)
url="http://feldrise.com"
license=('custom:MIT')
depends=('qt5-base' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-location')
source=(http://feldrise.com/Sielo/Linux/$pkgname-$pkgver.tar.gz)
md5sums=('be3a41281d63bf1459be61cbbb2d0ef4')
build() {
	cd $srcdir/$pkgname
	make || return 1
}
package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/bin/
	cp bin/SieloNavigateurV3-WebEngine $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/SieloNavigateurV3-WebEngine 
}
