# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=ablur
_pkgname2=ablur-small
_pkgname3=ablur-big
pkgname=plank-theme-ablur
pkgver=1.0.2
pkgrel=1
pkgdesc='Ablur Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1520823'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('23f4ec2cabc5a9b8c45c7551e32286df2ae1dc9c529cb9c98d91de89787ab2f8')

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
}
