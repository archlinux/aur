# Maintainer: Robbie <zoqaeski AT gmail DOT com>

pkgname=otf-fira-mono-fonts
pkgver=3.205
pkgrel=1
pkgdesc="Mozilla's new typeface, used in Firefox OS"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=(http://www.carrois.com/downloads/fira_mono_3_2/FiraMonoFonts3205.zip)
url="http://www.carrois.com/en/fira-4-1/"
install=${pkgname}.install
license=("custom: SIL Open Font License")
sha256sums=('9fe204e4549235d7ca2364f93650b2089301fd3f3cd18763c4e02f3d91e7a47d')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/FiraMonoFonts3205/OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
	install -D -m644 "${srcdir}/FiraMonoFonts3205/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
