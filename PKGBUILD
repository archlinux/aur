# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-tatooine_endor_deathstar
pkgver=1.1
pkgrel=1
pkgdesc="Celestia addon: Fictional: Star Wars: Tatooine, Endor and Death Star"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1625'
license=('Free for personal use')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-tatooine-endor-deathstar')
source=('http://www.celestiamotherlode.net/creators/jestr/StarWars_upd.zip')
install=$pkgname.install
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/extras/SW-Basic/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('c98a8ce43f0894bbf7c309d0f1063944')
