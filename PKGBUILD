# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname1=bloomish
pkgname=plank-theme-bloomish
pkgver=1.0.1
pkgrel=1
pkgdesc='Bloomish Theme for Plank'
arch=(any)
url='https://www.gnome-look.org/p/1216527'
_url="https://github.com/MMcQueenGNU"
license=('cc-by-sa')
source=("$_url/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('66834a21258ff8ba9b6a0aa76f4017e968c64e4618f330a9c84efb7179ba5513')

build() {
	true
}

package() {
	
	mkdir -p $pkgdir/usr/share/plank/themes/$_pkgname1
	cd "$srcdir/$pkgname-$pkgver/$_pkgname1"
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/$_pkgname1

}
