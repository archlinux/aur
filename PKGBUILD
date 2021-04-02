# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-deep_impact
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Other: Deep Impact"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_639.html'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-deep-impact')
source=('https://celestiamotherlode.net/creators/jestr/DeepImpact.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/DeepImpact" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('7225528f90a4879cf5abaf2911c8fecd')
