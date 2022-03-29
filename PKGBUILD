# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=window-soft-light
_pkgname2=window-soft-dark
pkgname=plank-theme-window-soft
pkgver=1.0.1
pkgrel=1
pkgdesc='Window Soft Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1722759'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
depends=('plank')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('f90cbb50e741a73283ed9a810af969c7752217daafbc8724629492b492e089c9')

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
