# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=hope-cool
_pkgname2=hope-extend
_pkgname3=hope-original
_pkgname4=hope-slim
pkgname=plank-theme-hope
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Hope Edition Themes for Plank'
arch=(any)
url='https://www.pling.com/p/1301622/'
_url="https://github.com/MMcQueenGNU"
license=('CC-BY-SA')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('f3c5c7229afa4ab6b9e2f4dd73e850b054728ce0fcb7921171017bad46104d11')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname2
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname3
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname4
	cd "$srcdir/$pkgname-$pkgver/$_pkgname"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname2"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname2/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname3"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname3/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname4"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname4/
}

