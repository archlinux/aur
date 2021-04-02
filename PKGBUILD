# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-tatooine_endor_deathstar
pkgver=1.1
pkgrel=2
pkgdesc="Celestia addon: Fictional: Star Wars: Tatooine, Endor and Death Star"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_1625.html'
license=('Free for personal use')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-tatooine-endor-deathstar')
source=('https://www.celestiamotherlode.net/creators/jestr/StarWars_upd.zip')
install=$pkgname.install
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/extras/SW-Basic/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('c98a8ce43f0894bbf7c309d0f1063944')
