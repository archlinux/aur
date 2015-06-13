# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-sun
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Sol: Texture Maps: Sun"
arch=('any')
url="http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1014"
license=('Free')
depends=('celestia')
makedepends=('unzip')
source=("http://www.celestiamotherlode.net/creators/fsgregs/Sun-new-2010.zip")
install="${pkgname}.install"
	
package() {
	install -dm755 "$pkgdir/usr/share/celestia/extras"
	install -dm777 "$pkgdir/tmp"
	cp --recursive "$srcdir/Sun-new/extras/" "$pkgdir/usr/share/celestia/"
	cp --recursive "$srcdir/Sun-new/textures/Medres/gstar.jpg" "$pkgdir/tmp/"
}

md5sums=('be51034cdf82bbe2c40c55311c524481')
