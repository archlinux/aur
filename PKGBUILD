# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=digitall-cool-blue
_pkgname2=digitall-cool-charcoal
_pkgname3=digitall-cool-green
_pkgname4=digitall-cool-purple
_pkgname5=digitall-cool-red
_pkgname6=digitall-cool-white
pkgname=plank-theme-digitall-cool
pkgver=1.0.1
pkgrel=1
pkgdesc='Digitall Cool Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1299253'
_url="https://github.com/MMcQueenGNU"
license=('mit')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('97d11114939788333f8dbe50feca309c45034e8ca6c3bdc97dbcde23ae5c21f9')

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

