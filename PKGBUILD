# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-millenium_falcon
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Fictional: Star Wars: Millenium Falcon"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_159.html'
license=('unknown')
depends=('celestia' 'celestia-addon-tatooine_endor_deathstar')
makedepends=('unzip')
conflicts=('celestia-addon-millenium-falcon')
source=('https://celestiamotherlode.net/creators/jestr/SW-Falcon.zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras/SW-Falcon/"{models,textures/medres}
	cp --recursive "$srcdir/SW-Falcon/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('43d21711998265e8bff5704398625d0c')
