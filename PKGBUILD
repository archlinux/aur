# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=monterey-dim-dark
_pkgname2=monterey-dim-grey
_pkgname3=monterey-dim-light
_pkgname4=monterey-dim-rust
pkgname=plank-theme-monterey-dim
pkgver=1.0.1
pkgrel=1
pkgdesc='Monterey Dim Theme for Plank'
arch=(any)
url='https://www.pling.com/p/1718565'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
depends=('plank')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('4c277160f0d93c58af4e7663a6030425a371863a389d53b48d15bc01fce069d5')

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
