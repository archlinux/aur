# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=platus-cool
_pkgname2=platus-extend
_pkgname3=platus-next
_pkgname4=platus-slim
_pkgname5=platus-trend
_pkgname6=platus-uppercase
_pkgname7=platus-prime
pkgname=plank-theme-platus
pkgver=1.0.2
pkgrel=1
pkgdesc='Collection of Platus Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1301106'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c060045618b246f4802226364614b87cd26184064c6c6cffcbbf701e4fd09a9f')

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
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname1/
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
