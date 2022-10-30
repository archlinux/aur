# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=digitall-uppercap-blue
_pkgname2=digitall-uppercap-charcoal
_pkgname3=digitall-uppercap-green
_pkgname4=digitall-uppercap-purple
_pkgname5=digitall-uppercap-red
_pkgname6=digitall-uppercap-white
pkgname=plank-theme-digitall-uppercap
pkgver=1.0.1
pkgrel=1
pkgdesc='Digitall Uppercap Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1299253'
_url="https://github.com/MMcQueenGNU"
license=('mit')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6dbab1eb1080398b07c0c32f50c5b3d19eda6aff859ac25220c5f1357a21552a')

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

