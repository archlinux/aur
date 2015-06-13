# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-apollo_soyuz
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: Apollo-Soyuz Test Project"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=269'
license=('unknown, free')
depends=('celestia')
makedepends=('unzip')
conflicts=('celestia-addon-apollo-soyuz')
source=('http://celestiamotherlode.net/creators/jackhiggins/astpmodel.zip'
        'http://celestiamotherlode.net/creators/jackhiggins/astp.zip')
install=$pkgname.install

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/models"
	mkdir --parents "$pkgdir/usr/share/celestia/textures/medres"
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp "$srcdir/ASTP.3ds" "$pkgdir/usr/share/celestia/models"
	cp "$srcdir/cccp_flag.bmp" "$pkgdir/usr/share/celestia/textures/medres"
	cp "$srcdir/soyuz_astp_solar.bmp" "$pkgdir/usr/share/celestia/textures/medres"
	cp "$srcdir/JACK_ASTP.ssc" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('05997e0ff88353d2078bba0f593ce0d1'
         '917491d80393e6a4f339bbb3f17bb41f')
