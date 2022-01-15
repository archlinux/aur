# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=catalinas-cool
_pkgname2=catalinas-extend
_pkgname3=catalinas-original
_pkgname4=catalinas-pill
_pkgname5=catalinas-slim
_pkgname6=catalinas-uppercap
pkgname=plank-theme-catalinas
pkgver=1.0.1
pkgrel=2
pkgdesc='Catalinas Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1311056/'
_url="https://github.com/MMcQueenGNU"
license=('CC-NC-ND')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('2f59cde207ae0d1613227cc4971384ee95ca652757cb37069e74caccdb75b876')

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
