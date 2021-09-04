# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=sapphire-cool
_pkgname2=sapphire-extend
_pkgname3=sapphire-prime
_pkgname4=sapphire-slim
_pkgname5=sapphire-trend
_pkgname6=sapphire-uppercap
pkgname=plank-theme-sapphire
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Sapphire Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1298902/'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('d9558fa1ce3b07a686de4156c8fc9c090293be679e77e367d66c4765441c6a03')

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
