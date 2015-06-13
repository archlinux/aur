# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-spaceman_spiff
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Fictional: Craft and Stations: Spaceman Spiff"
arch=('any')
url="http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=825"
license=('Free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-spaceman-spiff')
source=("http://www.celestiamotherlode.net/creators/lukr/Spiff.zip")
	
package() {
	install -Dm644 "$srcdir/Spiff/models/spiff.3ds" "$pkgdir/usr/share/celestia/models/spiff.3ds"
	install -Dm644 "$srcdir/Spiff/textures/medres/Spiffarrow.jpg" "$pkgdir/usr/share/celestia/textures/medres/Spiffarrow.jpg"
	install -Dm644 "$srcdir/Spiff/Spiff.ssc" "$pkgdir/usr/share/celestia/extras/Spiff.ssc"
}

md5sums=('eebbe406fd453e0fe51c9a9ca5793d27')
