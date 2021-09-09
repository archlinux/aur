# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=ixi-inlight-prime
_pkgname2=ixi-inlight-cool
_pkgname3=ixi-inlight-slim
_pkgname4=ixi-inlight-trend
_pkgname5=ixi-inlight-extend
_pkgname6=ixi-inlight-next
_pkgname7=ixi-inlight-uppercap
pkgname=plank-theme-ixi-inlight
pkgver=1.0.2
pkgrel=1
pkgdesc='Collection of iXi-inLight Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1309769/'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c6c376b6e1896cfff7dc568f7fb6eb5a28e0542f4ca75a6ccf96d474b1518924')

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
