# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-data-stora
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc="Anti-Shade theme for Plank"
arch=('any')
url='https://www.pling.com/p/1299919'
license=('CC BY NC ND')
depends=('plank')
makedepends=('git')
source=("git://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/data-stora
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/data-stora/
}
