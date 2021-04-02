# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-xwing
pkgver=1
pkgrel=3
pkgdesc="Celestia addon: Fictional: Star Wars: X-Wing"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_154.html'
license=('unknown')
depends=('celestia' 'celestia-addon-tatooine_endor_deathstar')
makedepends=('unzip')
source=('https://celestiamotherlode.net/creators/jestr/SW-X-wing.zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-X-wing/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('e44fb103d654a50446fbb6e37ab5eb0c')
