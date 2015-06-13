# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-voyagers
pkgver=2
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Other: Voyagers 1 & 2"
arch=('any')
url="http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=355"
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
source=("http://www.celestiamotherlode.net/creators/fsgregs/jackhiggins_spacecraft/voyager-full.zip")
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras/"
	cp --recursive "$srcdir/voyager-full" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('db3d0b83647514ffba5ca89e9af53611')
