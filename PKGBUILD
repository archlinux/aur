# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-atlantis_2
pkgver=2.0
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: Atlantis with Flight Deck"
arch=('any')
url="https://www.celestiamotherlode.net/addon/addon_861.html"
license=('Creative Commons, some rights reserved')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-atlantis-2')
source=("https://www.celestiamotherlode.net/creators/elchristou/EC_Atlantis_FD.zip")

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras/"
	cp --recursive "$srcdir/EC_Atlantis_FD" "$pkgdir/usr/share/celestia/extras/"
	# Fix file permission problem:
	chmod 644 "$pkgdir/usr/share/celestia/extras/EC_Atlantis_FD/Atlantis.ssc"
}

md5sums=('08e74b20c0969c998ce230be8a0061a2')
