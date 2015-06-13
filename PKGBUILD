# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-xwing
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Fictional: Star Wars: X-Wing"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=154'
license=('unknown, free')
depends=('celestia' 'celestia-addon-tatooine_endor_deathstar')
makedepends=('unzip')
source=('http://celestiamotherlode.net/creators/jestr/SW-X-wing.zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-X-wing/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('e44fb103d654a50446fbb6e37ab5eb0c')
