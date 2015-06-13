# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-deep_impact
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Other: Deep Impact"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=639'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-deep-impact')
source=('http://celestiamotherlode.net/creators/jestr/DeepImpact.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/DeepImpact" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('7225528f90a4879cf5abaf2911c8fecd')
