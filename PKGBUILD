# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-hubble_space_telescope
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: Hubble Space Telescope"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=287'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-hubble-space-telescope')
source=('http://celestiamotherlode.net/creators/jestr/BigHubbleCMOD_V3.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/BigHubbleCMOD/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('70978b99cb929b5472d8b9ea7f2faedc')
