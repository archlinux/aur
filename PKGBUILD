# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-2010_exoplanets_ii
pkgver=1.0
pkgrel=1
pkgdesc="Celestia addon: Extrasolar: Stars: 2010 Exoplanets II"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1516'
license=('Public Domain')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/Brad/2010_Exoplanets_II.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp -rT "$srcdir/2010 Exoplanets II" "$pkgdir/usr/share/celestia/extras"
}

md5sums=('2548c0031d782c05f2630c79b494db80')
