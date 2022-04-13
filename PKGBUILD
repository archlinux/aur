# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=mohave-dark
_pkgname2=mohave-light
_pkgname3=mohave-rust
_pkgname4=mohave-grey
pkgname=plank-theme-mohave
pkgver=2.0.1
pkgrel=1
pkgdesc='Mohave Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1315686'
_url="https://github.com/MMcQueenGNU"
license=('cc-by-sa')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('1d254e99e8bfa189ec21070e0955a99ade682e7d8e4281e59c308d21a99db586')

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
