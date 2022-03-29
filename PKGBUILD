# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-data-stora
pkgname=$_pkgname-git
pkgver=0.3
pkgrel=1
pkgdesc="Data-Stora theme for Plank"
arch=('any')
url='https://www.pling.com/p/1299919'
license=('CC BY NC ND')
depends=('plank')
makedepends=('git')
source=("$pkgname::git+https://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/data-stora
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/data-stora/
}
