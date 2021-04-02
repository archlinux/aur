# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-sun
pkgver=1
pkgrel=3
pkgdesc="Celestia addon: Sol: Texture Maps: Sun"
arch=('any')
url="https://www.celestiamotherlode.net/addon/addon_1014.html"
license=('Free')
depends=('celestia')
makedepends=('unzip')
source=("https://www.celestiamotherlode.net/creators/fsgregs/Sun-new-2010.zip")
install="${pkgname}.install"
	
package() {
	install -dm755 "$pkgdir/usr/share/celestia/extras"
	install -dm755 "$pkgdir/usr/share/celestia/textures/medres/"
	cp --recursive "$srcdir/Sun-new/extras/" "$pkgdir/usr/share/celestia/"
	cp "$srcdir/Sun-new/textures/Medres/gstar.jpg" "$pkgdir/usr/share/celestia/textures/medres/gstar_celestia-addon-sun.jpg"
}

md5sums=('be51034cdf82bbe2c40c55311c524481')
