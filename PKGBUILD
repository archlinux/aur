# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-voyagers
pkgver=2
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Other: Voyagers 1 & 2"
arch=('any')
url="http://www.celestiamotherlode.net/addon/addon_355.html"
license=('unknown')
depends=('celestia')
makedepends=('unzip')
source=("https://www.celestiamotherlode.net/creators/fsgregs/jackhiggins_spacecraft/voyager-full.zip")
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras/"
	cp --recursive "$srcdir/voyager-full" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('db3d0b83647514ffba5ca89e9af53611')
