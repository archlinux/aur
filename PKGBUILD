# Maintainer: McQueen <clear3239@yahoo.com>
_pkgname=plank-theme-foggy-round
pkgname=$_pkgname-git
pkgver=0.4
pkgrel=1
pkgdesc="Foggy-Round theme for Plank"
arch=('any')
url='https://www.gnome-look.org/p/1201603/'
license=('GPL3')
depends=('plank')
makedepends=('git')
source=("https://github.com/MMcQueenGNU/$_pkgname.git")
sha256sums=('f55529f6279227652c25c81c1cb93dff2691e72c37c3028be694e787f903ec31')

build() {
	true
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/foggy-round
	install -m 755 dock.theme $pkgdir/usr/share/plank/themes/foggy-round/
}
