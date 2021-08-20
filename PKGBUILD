# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=platus-cool
_pkgname2=platus-extend
_pkgname3=platus-next
_pkgname4=platus-slim
_pkgname5=platus-trend
_pkgname6=platus-uppercase
_pkgname7=platus-prime
pkgname=plank-theme-platus
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Platus Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1301106'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('820a5b76e7da2f03829b1a492368501d7a8451016e422e89090319f58251ec6d')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname1
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname2
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname3
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname4
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname5
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname6
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname7
	cd "$srcdir/$pkgname-$pkgver/$_pkgname1"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname2"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname2/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname3"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname3/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname4"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname4/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname5"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname5/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname6"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname6/
	cd "$srcdir/$pkgname-$pkgver/$_pkgname7"	
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname7/
}
