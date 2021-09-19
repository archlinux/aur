# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=wingy2r
pkgname=plank-theme-wingy2r
pkgver=1.0.1
pkgrel=1
pkgdesc='Wingy2r Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1192956'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('e1f83858148290ad5c6eccc0461e8a9301f4e4a24b3cb053ebb9feec5706a08a')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname
	cd "$srcdir/$pkgname-$pkgver/$_pkgname"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname/

}
