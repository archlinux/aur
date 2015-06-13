# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-international_space_station
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Spacecraft: Earth Orbit: International Space Station"
arch=('any')
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=293'
license=('free')
depends=('celestia')
makedepends=('unzip')
source=('http://www.celestiamotherlode.net/creators/orion_nebula/isstextures.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss1.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss2.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss3.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss4.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss5.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss6.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss7.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss8.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss9.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss10.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss11.zip'
	'http://www.celestiamotherlode.net/creators/orion_nebula/iss12.zip'
        'http://www.celestiamotherlode.net/creators/orion_nebula/isscomplete.zip')
	
package() {
	mkdir --parents "$pkgdir"/usr/share/celestia/{extras,models,textures/medres}
	cd "$srcdir"
	cp *.ssc "$pkgdir/usr/share/celestia/extras/"
	cp *.3DS "$pkgdir/usr/share/celestia/models/"
	cp "#ISS-Evolution_lire.txt" "$pkgdir/usr/share/celestia/extras/"
	for file in *.bmp
		do mv $file `echo $file | sed 's/\(.*\)/\U\1/'`
	done
	cp *.BMP "$pkgdir/usr/share/celestia/textures/medres/"
}

md5sums=('8c29bee1e981f08d9003947fbc7dd91a'
         '3a9d4ff9e21d2f889af13c5226c38f76'
         '215d0012f6e7aae3c8ed4bd0a068e16a'
         '0113aa6e4301e475cb44803d40c508fc'
         '28d7679e01d413cee649ef8b861d0f63'
         '971295392a8b17fa24d2b50174c278d0'
         '57c4a342d3a228bde03080ba94f4be75'
         'd93807f3201644046bc8ca071807a18a'
         '0f25f3af177771128aa52f69965bda83'
         'cab2af968385f8a5f94c91adc5a02c37'
         '2836ce2ceb9e1dc80f47b716d3e78cfa'
         'cbfeca74474ea2be0eb2ffb052bc6942'
         'aa0d3b51b595b79c761bcdcdb2b3731a'
         '2ea57b66709eae748f8a6f96ffcf0854')
