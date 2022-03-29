# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=electro-flare
_pkgname2=electro-foton
_pkgname3=electro-juicy
_pkgname4=electro-ligthroom
_pkgname5=electro-party
_pkgname6=electro-static
pkgname=plank-theme-electro
pkgver=1.0.1
pkgrel=1
pkgdesc='Electro Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1409928'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
depends=('plank')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('b83ca4a81955d9918fa3effaf9ed5e48c9b8f3990b5e16dc28716c56f748e5f7')

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
