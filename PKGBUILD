# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-deep_impact_spacecraft
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Other: Deep Impact Spacecraft"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=22'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-deep-impact-spacecraft')
source=('http://celestiamotherlode.net/creators/jackhiggins/deepimpact_impactormodel.zip'
	'http://celestiamotherlode.net/creators/jackhiggins/deepimpact_impactor.zip')
	
package() {
	cd "$scrdir"
	install -D "$srcdir/JACKdeepimpact-xyz.ssc" "$pkgdir/usr/share/celestia/extras/JACKdeepimpact-xyz.ssc"
	install -D "$srcdir/deepimpact_impactor.xyz" "$pkgdir/usr/share/celestia/data/deepimpact_impactor.xyz"
	install -D "$srcdir/deepimpact_impactor.3ds" "$pkgdir/usr/share/celestia/models/deepimpact_impactor.3ds"
}

md5sums=('0cd6cb849b2b6dc15ce7f103f8a959dc'
         '2d33062963ca8c521016112887d43474')
