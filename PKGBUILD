# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=digitall-extend-blue
_pkgname2=digitall-extend-charcoal
_pkgname3=digitall-extend-green
_pkgname4=digitall-extend-purple
_pkgname5=digitall-extend-red
_pkgname6=digitall-extend-white
pkgname=plank-theme-digitall-extend
pkgver=1.0.1
pkgrel=1
pkgdesc='Digitall Extend Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1299253'
_url="https://github.com/MMcQueenGNU"
license=('mit')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('1874d151f9131be4f5c365180420a4b56d18d8951aa89e48d929557497210513')

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
		mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname5
	cd "$srcdir/$pkgname-$pkgver/$_pkgname5"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname5
		mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname6
	cd "$srcdir/$pkgname-$pkgver/$_pkgname6"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname6
}

