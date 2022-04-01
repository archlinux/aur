# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=catalin
_pkgname2=catalin-dark
pkgname=plank-theme-catalin
pkgver=1.0.1
pkgrel=1
pkgdesc='Catalin Theme for Plank'
arch=(any)
url='https://www.pling.com/p/1332504'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
depends=('plank')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('2c2963520820c3fd6d74a22bb5a71bbaf88479459237e288cd2f64ec171b67f3')

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
