# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=gruvbox-dark
_pkgname2=gruvbox-middark
pkgname=plank-theme-gruvbox
pkgver=1.0.1
pkgrel=1
pkgdesc='Gruvbox Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1681813'
_url="https://github.com/MMcQueenGNU"
license=('CC-NC-ND')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c29b4f11beacd7ff2567dd1b51505dbb11aca7d17fb6b7e5146438eecdbd4181')

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
