#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-smc-malayalam
pkgver=19.6
pkgrel=1
pkgdesc="Fonts for Malayalam released by Swathanthra Malayalam Computing"
url="http://smc.org.in/fonts/"
license=('custom:OFL')
conflicts=('ttf-malayalam-fonts-meta'
	'ttf-malayalam-font-anjalioldlipi'
	'ttf-malayalam-font-chilanka'
	'ttf-malayalam-font-dyuthi'
	'ttf-malayalam-font-keraleeyam'
	'ttf-malayalam-font-meera'
	'ttf-malayalam-font-rachana'
	'ttf-malayalam-font-raghumalayalamsans'
	'ttf-malayalam-font-suruma'
	'ttf-malayalam-font-manjari')
arch=(any)
source=("LICENSE.txt"
	"https://smc.org.in/downloads/fonts/rachana/Rachana-Regular.ttf"
	"https://smc.org.in/downloads/fonts/rachana/Rachana-Bold.ttf"
	"https://smc.org.in/downloads/fonts/meera/Meera-Regular.ttf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.otf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.otf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.otf"
	"https://smc.org.in/downloads/fonts/anjalioldlipi/AnjaliOldLipi-Regular.ttf"
	"https://smc.org.in/downloads/fonts/suruma/Suruma.ttf"
	"https://smc.org.in/downloads/fonts/raghumalayalamsans/RaghuMalayalamSans-Regular.ttf"
	"https://smc.org.in/downloads/fonts/dyuthi/Dyuthi-Regular.ttf"
	"https://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam-Regular.ttf"
	"https://smc.org.in/downloads/fonts/uroob/Uroob-Regular.ttf"
	"https://smc.org.in/downloads/fonts/chilanka/Chilanka-Regular.ttf"
	"https://smc.org.in/downloads/fonts/karumbi/Karumbi-Regular.ttf")

md5sums=('55fa571b7e08283f24c93621194373c7'
         '80d0e7ee6c910325d54c74e96fa51311'
         'da269e59d4cec4726b76ca058b5a2598'
         '0be3384c30ecf2a7cccb121f475684bf'
         'f5b807b946e3143ca615c73145195003'
         '6ba3ca81dac063c6eb6d5564226cee64'
         '4eac8684c344f396849f2e43af78a6ab'
         '78560d6c3d6eaafe8a3d80fc385da019'
         '00d4598d7318a36c21b25a3568f0b73d'
         '89a0ee20de3301d71dde836a65eb5a4d'
         'a4197fa15cab5808106df900db07c2ed'
         'f5353ee42422f0e493ad2affc9ab0dd9'
         '63ddb5360891c820b6c4d6fdc048ab7b'
         '303d597b27ba15e5c67700fd9508ee64'
         '57285cae8f1a08813291667b0fc82665')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF/malayalam"
	install -d "$pkgdir/usr/share/fonts/malayalam"
	install -d "$pkgdir/usr/share/doc/fonts-smc-malayalam"
	install -t "$pkgdir/usr/share/doc/fonts-smc-malayalam" -m644 "LICENSE.txt"
	install -t "$pkgdir/usr/share/fonts/TTF/malayalam" -m644 *.ttf
	install -t "$pkgdir/usr/share/fonts/malayalam" -m644 *.otf
}


