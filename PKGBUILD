# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-ulysses
pkgver=2.0
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Other: Ulysses"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=351'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/fsgregs/jackhiggins_spacecraft/Ulysses-full.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/Ulysses-full/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('07a637f2d5da8c1af71bdfaaa4679761')
