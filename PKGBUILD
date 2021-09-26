# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=monterey
_pkgname2=monterey-dark
_pkgname3=monterey-rust
_pkgname4=monterey-grey
pkgname=plank-theme-monterey
pkgver=1.0.1
pkgrel=1
pkgdesc='Monterey Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1565552'
_url="https://github.com/MMcQueenGNU"
license=('cc-by-sa')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('1b4b2c9718d19d9f51a51a01b7065b92190e477a3016fa63e1db43388e2c586f')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname1
	cd "$srcdir/$pkgname-$pkgver/$_pkgname1"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname1
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname2
	cd "$srcdir/$pkgname-$pkgver/$_pkgname2"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname2
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname3
	cd "$srcdir/$pkgname-$pkgver/$_pkgname3"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname3
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname4
	cd "$srcdir/$pkgname-$pkgver/$_pkgname4"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname4

}
