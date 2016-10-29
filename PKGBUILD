# Maintiner: Victor DENIS <victordenis01@gmail.com>
# Contributor: 
pkgbase=sielo-navigateur
pkgname=sielo-navigateur
pkgver=0.2.2
pkgrel=3
pkgdesc="A fast web browser made in C++14 with Qt5.7"
arch=(x86_64)
url="http://feldrise.com"
license=('custom:MIT')
depends=('qt5-base' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-location')
source=(http://feldrise.com/Sielo/Linux/$pkgname-$pkgver.tar.gz)
md5sums=('1f35ef90db2188b6eec10fac08597e2f')
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
