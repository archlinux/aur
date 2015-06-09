# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=ttf-animeace
pkgver=2.0
pkgrel=4
pkgdesc="AnimeAce font ©Nate Piekos: the perfect font for editing and translation of comics and manga scans."
arch=('any')
url="http://www.blambot.com/font_animeace2.shtml"
license=("http://www.blambot.com/license.shtml")
depends=('fontconfig')
install=${pkgname}.install
source=('http://www.blambot.com/fonts/animeace2bb_tt.zip')
md5sums=('3e2a52d8585fa93a66d2b7f922310f11')

package() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
