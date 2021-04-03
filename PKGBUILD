# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-deep_impact_spacecraft
pkgver=1
pkgrel=3
pkgdesc="Celestia addon: Spacecraft: Other: Deep Impact Spacecraft"
arch=('any')
url='http://www.celestiamotherlode.net/addon/addon_22.html'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-deep-impact-spacecraft')
source=('https://celestiamotherlode.net/creators/jackhiggins/deepimpact_impactormodel.zip'
        'https://celestiamotherlode.net/creators/jackhiggins/deepimpact_impactor.zip')

package() {
	cd "$scrdir"
	install -D "$srcdir/JACKdeepimpact-xyz.ssc" "$pkgdir/usr/share/celestia/extras/JACKdeepimpact-xyz.ssc"
	install -D "$srcdir/deepimpact_impactor.xyz" "$pkgdir/usr/share/celestia/data/deepimpact_impactor.xyz"
	install -D "$srcdir/deepimpact_impactor.3ds" "$pkgdir/usr/share/celestia/models/deepimpact_impactor.3ds"
}

md5sums=('0cd6cb849b2b6dc15ce7f103f8a959dc'
         '2d33062963ca8c521016112887d43474')
