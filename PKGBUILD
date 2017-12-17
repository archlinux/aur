# Maintiner: Victor DENIS <victordenis01@gmail.com>
# Contributor: hotaru70o, ilearn32
pkgbase=sielo-browser
pkgname=sielo-browser
pkgver=1.8.00
pkgrel=1
pkgdesc="A simple, customizable and fast web browser"
arch=(x86_64)
url="https://feldrise.com/Sielo"
license=('custom:MIT')
depends=('openssl-1.0' 'qt5-base' 'qt5-webengine' 'qt5-webchannel' 'qt5-location' 'qt5-declarative')
replaces=('sielo-navigateur')
source=(https://www.feldrise.com/Sielo/Linux/$pkgname-$pkgver.tar.gz)
md5sums=('3f6d5701665b58bfdec650b4cf99834b')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	cp -r usr $pkgdir/
	chmod +x $pkgdir/usr/bin/sielo-browser
	chmod +x $pkgdir/usr/bin/sielo-compiler
}
