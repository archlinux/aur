# Maintainer: SanskritFritz (gmail)

_gitname=meandmyshadow_levelpack_akos
pkgname=$_gitname-git
pkgver=1
pkgrel=1
pkgdesc="Ákos level pack for the Me and my Shadow game"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=293'
license=('free')
depends=('meandmyshadow')
source=("$_gitname::git+https://github.com/SanskritFritz/meandmyshadow_levelpack_akos.git")
md5sums=('SKIP')

package() {
	mkdir --parents "$pkgdir/usr/share/meandmyshadow/data/levelpacks/akos"
	cp "$srcdir"/$_gitname/{*.map,levels.lst} "$pkgdir/usr/share/meandmyshadow/data/levelpacks/akos/"
}

