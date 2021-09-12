# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=polar-fox-inice
_pkgname2=polar-fox-cool
_pkgname3=polar-fox-slim
_pkgname4=polar-fox-original
_pkgname5=polar-fox-extend
_pkgname6=polar-fox-next
pkgname=plank-theme-polar-fox
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Polar-Fox Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1296131/'
_url="https://github.com/MMcQueenGNU"
license=('CC-NC-ND')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c5171670d9221ba7e8c887d1d3ed18bc4b5a0d62df1059915fd68de87f6079f2')

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

}
