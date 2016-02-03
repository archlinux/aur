# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-2009_exoplanets
pkgver=1.0
pkgrel=1
pkgdesc="Celestia addon: Extrasolar: Stars: 2009 Exoplanets"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1451'
license=('Public Domain')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/Brad/2009_Exoplanets.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp -rT "$srcdir/2009 Exoplanets" "$pkgdir/usr/share/celestia/extras"
}

md5sums=('adff71da625a7e21dc69ea428e3d2956')
