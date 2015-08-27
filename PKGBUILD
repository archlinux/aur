# Maintainer: Robbie <zoqaeski AT gmail DOT com>

pkgname=otf-fira-fonts
pkgver=4.105
pkgrel=1
pkgdesc="Mozilla's new typeface, used in Firefox OS"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(http://www.carrois.com/downloads/fira_4_1/FiraFonts4105.zip)
url="http://www.carrois.com/en/fira-4-1/"
install=${pkgname}.install
license=("custom: SIL Open Font License")
sha256sums=('dfadd8632bb0065bdb60fe98d03e7fcfa431614225755c750fcc9d7bec9da7a0')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraFonts4105/OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraFonts4105/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
