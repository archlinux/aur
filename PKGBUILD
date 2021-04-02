# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-global_water_volume
pkgver=1.0
pkgrel=2
pkgdesc="Celestia addon: Earth: Surface Map Textures: Global Water Volume"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_1635.html'
license=('n/a')
depends=('celestia')
makedepends=('unzip')
source=('https://www.celestiamotherlode.net/creators/particlegrasp/GlobalWaterVolume.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/GlobalWaterVolume" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('7f20d63d094ecd9b486f711b212ce27f')
