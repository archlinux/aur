# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=glossient-cool
_pkgname2=glossient-extend
_pkgname3=glossient-prime
_pkgname4=glossient-slim
_pkgname5=glossient-trend
_pkgname6=glossient-uppercap
pkgname=plank-theme-glossient
pkgver=1.0.1
pkgrel=1
pkgdesc='Collection of Glossient Edition Themes for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1297011/'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('00ca6f02fc0cc51ef52eafbea7be2d864efc7363cd7de72aef609afc0a720bb0')

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
