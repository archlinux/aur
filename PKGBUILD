# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-spitzer_space_telescope
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: Spitzer Space Telescope"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_301.html'
license=('unknown')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-spitzer-space-telescope')
source=('https://celestiamotherlode.net/creators/jackhiggins/spitzermodel.zip'
	'https://celestiamotherlode.net/creators/jackhiggins/spitzer.zip')
install="${pkgname}.install"
	
package() {
	install -D "$srcdir/JACKspitzer-xyz.ssc" "$pkgdir/usr/share/celestia/extras/JACKspitzer-xyz.ssc"
	install -D "$srcdir/sirtf.xyz" "$pkgdir/usr/share/celestia/data/spitzer.xyz"
	install -D "$srcdir/spitzer.3ds" "$pkgdir/usr/share/celestia/models/spitzer.3ds"
}

md5sums=('c8930d2e2b500e0a92c209c256abc97e'
         '127b14520d848bf1ef322e0864e8c50c')
