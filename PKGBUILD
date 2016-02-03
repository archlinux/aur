# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-2010_exoplanets
pkgver=1.0
pkgrel=1
pkgdesc="Celestia addon: Extrasolar: Stars: 2010 Exoplanets"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=1450'
license=('Public Domain')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/Brad/2010_Exoplanets.zip')
	
package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp -rT "$srcdir/2010 Exoplanets" "$pkgdir/usr/share/celestia/extras"
}

md5sums=('d4e64e1f73dc14caceb78e34f06af919')
