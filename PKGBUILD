# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=ixi-indark-prime
_pkgname2=ixi-indark-cool
_pkgname3=ixi-indark-slim
_pkgname4=ixi-indark-trend
_pkgname5=ixi-indark-extend
_pkgname6=ixi-indark-next
_pkgname7=ixi-indark-uppercap
pkgname=plank-theme-ixi-indark
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of iXi-inDark Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1310837/'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('ae5f5fb8a9c6177d7cbaaa6a9b5ac68bf593e0e1e8429366612a729c50edbdd1')

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
