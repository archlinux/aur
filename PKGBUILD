# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=sirius-deeplight-cool
_pkgname2=sirius-deeplight-extend
_pkgname3=sirius-deeplight-next
_pkgname4=sirius-deeplight-pill
_pkgname5=sirius-deeplight-prime
_pkgname6=sirius-deeplight-slim
_pkgname7=sirius-deeplight-trend
_pkgname8=sirius-deeplight-uppercap
pkgname=plank-theme-sirius-deeplight
pkgver=1.0.1
pkgrel=1
pkgdesc='Sirius Deeplight Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1308718'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6f57578b724454c3f542f70d11882c6c23c226ee4e083172371d249a6dbe3d53')

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
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname7
	cd "$srcdir/$pkgname-$pkgver/$_pkgname7"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname7
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname8
	cd "$srcdir/$pkgname-$pkgver/$_pkgname8"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname8
}
