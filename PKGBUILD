# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-dax
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc="Dax theme for Plank"
arch=('any')
url='https://www.gnome-look.org/p/1224421/'
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("git://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('SKIP')

build() {
	true
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/dax
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/dax/
}
