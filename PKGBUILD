# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-global_water_volume
pkgver=1.0
pkgrel=1
pkgdesc="Celestia addon: Earth: Surface Map Textures: Global Water Volume"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1635'
license=('n/a')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/particlegrasp/GlobalWaterVolume.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/GlobalWaterVolume" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('7f20d63d094ecd9b486f711b212ce27f')
