# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-vaders_tie_fighter
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Fictional: Star Wars: Vader's Tie fighter"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=164'
license=('unknown, free')
depends=('celestia' 'celestia-addon-tatooine_endor_deathstar')
makedepends=('unzip')
conflicts=('celestia-addon-vaders-tie-fighter')
source=('http://celestiamotherlode.net/creators/jestr/SW-VaderTie.zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-VaderTie/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('878b01a99a206795283c7aced408d93e')
