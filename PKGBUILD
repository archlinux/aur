# Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-smc-malayalam
pkgver=18.5
pkgrel=1
pkgdesc="Fonts for Malayalam released by Swathanthra Malayalam Computing"
url="http://smc.org.in/fonts/"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
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
	"https://smc.org.in/downloads/fonts/meera/Meera.ttf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.otf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.otf"
	"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.otf"
	"https://smc.org.in/downloads/fonts/anjalioldlipi/AnjaliOldLipi.ttf"
	"https://smc.org.in/downloads/fonts/suruma/Suruma.ttf"
	"https://smc.org.in/downloads/fonts/raghumalayalamsans/RaghuMalayalamSans.ttf"
	"https://smc.org.in/downloads/fonts/dyuthi/Dyuthi.ttf"
	"https://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam.ttf"
	"https://smc.org.in/downloads/fonts/uroob/Uroob.ttf"
	"https://smc.org.in/downloads/fonts/chilanka/Chilanka.ttf"
	"https://smc.org.in/downloads/fonts/karumbi/Karumbi.ttf")
md5sums=('55fa571b7e08283f24c93621194373c7'
	'7ebad37f08a76d95c0d069fe5e4da2c7'
	'c9e49beb8c607dfa04d86b0e17ed8211'
	'cbb502b60c4b6d9a3b78f186f3beefe8'
	'c93a69e874aff59d98753406b05ee21b'
	'a763deb6b67f7012cdaf6264930f15d5'
	'3d7a31f75d77933e21a864725b37294d'
	'a338e73c5dd2baf2241ae07f05a9bc67'
	'00d4598d7318a36c21b25a3568f0b73d'
	'9417236366dbe7514d70ec681911874d'
	'b8f755e502700a14d116983a7e0cf85e'
	'8d2093968e3fca2ec879a87e1c145d8a'
	'3d868fe02372ec67a6095aa2690736b3'
	'dc3057a0ad1ad70353c9cb2ac5269682'
	'b702e348dec3420432da62aa871b618e')
install=fonts-smc-malayalam.install

package() {
	install -d "$pkgdir/usr/share/fonts/TTF/malayalam"
	install -d "$pkgdir/usr/share/fonts/malayalam"
	install -d "$pkgdir/usr/share/doc/fonts-smc-malayalam"
	install -t "$pkgdir/usr/share/doc/fonts-smc-malayalam" -m644 "LICENSE.txt"
	install -t "$pkgdir/usr/share/fonts/TTF/malayalam" -m644 *.ttf
	install -t "$pkgdir/usr/share/fonts/malayalam" -m644 *.otf
}

