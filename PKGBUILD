# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-hubble_space_telescope
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: Hubble Space Telescope"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_287.html'
license=('unknown')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-hubble-space-telescope')
source=('https://celestiamotherlode.net/creators/jestr/BigHubbleCMOD_V3.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/BigHubbleCMOD/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('70978b99cb929b5472d8b9ea7f2faedc')
