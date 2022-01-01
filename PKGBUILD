# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=window
_pkgname2=window-grey
_pkgname3=window-rust
_pkgname4=window-light
_pkgname4=window-russian-green
pkgname=plank-theme-window
pkgver=1.0.1
pkgrel=1
pkgdesc='Window Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1566901'
_url="https://github.com/MMcQueenGNU"
license=('cc-by-sa')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('61abce85a0c7abf76e8fe6d2c119dc03503a776d7a362c97bea1304ae861fab2')

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
