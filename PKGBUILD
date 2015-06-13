# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-earth_without_water_2
pkgver=2.0
pkgrel=1
pkgdesc="Celestia addon: Earth: Surface Map Textures: Earth without water 2"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1010'
license=('Creative Commons')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-earth-without-water-2')
source=('http://www.celestiamotherlode.net/creators/adirondack/earthwowater2_dds_vers2.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/"
	cp --recursive "$srcdir/extras/" "$pkgdir/usr/share/celestia/"
}

md5sums=('9fba068fec20398a6b6d306cb700a86e')
