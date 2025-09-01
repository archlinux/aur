# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=puck
pkgver="2.3.70"
_weird_number="261"
pkgrel=2
pkgdesc="Program for the use and computation of kinship data"
arch=(any)
url="https://www.kintip.net/"
license=('GPL-1.0-or-later')
depends=('jre8-openjdk')
source=("${_weird_number}-${pkgname}-${pkgver//\./\-}.zip::https://www.kintip.net/component/jdownloads/send/3-logiciels/${_weird_number}-${pkgname}-${pkgver//\./\-}"
 	    "puck.desktop")
noextract=()
sha256sums=('20414f0c57a11885b143bfdd408babb999cd08b93725ef4c7006d3f7daafe710'
            '068e53ce69005737d84ac37dfd7a65807a149293e10655952c92b214b6c4e34e')

package() {
	install -d -m775 "${pkgdir}/opt/puck"
	install -D -m644  ${pkgname}-${pkgver}/puck.jar "${pkgdir}/opt/puck"
	install -d -m775 "${pkgdir}/usr/share/applications/"
	install -D -m644 "puck.desktop" "${pkgdir}/usr/share/applications/"
}
