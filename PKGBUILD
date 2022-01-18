# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=tokyo-night-storm
_pkgname2=tokyo-night-dark
pkgname=plank-theme-tokyo-night
pkgver=1.0.1
pkgrel=1
pkgdesc='Tokyo Night Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1681818'
_url="https://github.com/MMcQueenGNU"
license=('CC-NC-ND')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('baef831d08b73c05bab1c21061704de2d521b29d8f22722c983d33371a5fcf86')

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
}
