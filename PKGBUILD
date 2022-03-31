# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=cream
_pkgname2=cream-dim
pkgname=plank-theme-cream
pkgver=1.0.1
pkgrel=1
pkgdesc='Cream Theme for Plank'
arch=(any)
url='https://www.opendesktop.org/p/1566110'
_url="https://github.com/MMcQueenGNU"
license=('GPL3')
depends=('plank')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('29617b5a41006b8fc6c0b60a13ad2c7d9876bceabb7f6be6c1880c8d6e39b3d4')

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
