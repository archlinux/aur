# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=mirabilis-dark
_pkgname2=mirabilis-dark-mac
pkgname=plank-theme-mirabilis-dark
pkgver=1.0.1
pkgrel=1
pkgdesc='Mirabilis Dark Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1325146'
_url="https://github.com/MMcQueenGNU"
license=('MIT')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('ed44318ba2b799a3ea6b5fe4c85ac6ccf04302fa4409468fbd007de2b0a793cc')

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
