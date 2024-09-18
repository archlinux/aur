# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=puck
pkgver="2.3.70"
_weird_number="261"
pkgrel=1
pkgdesc="Program for the use and computation of kinship data"
arch=(any)
url="https://www.kintip.net/"
license=('GPL')
depends=(jre7)
source=("${_weird_number}-${pkgname}-${pkgver//\./\-}.zip::https://www.kintip.net/component/jdownloads/send/3-logiciels/${_weird_number}-${pkgname}-${pkgver//\./\-}"
	"puck.desktop")
noextract=()
sha256sums=('20414f0c57a11885b143bfdd408babb999cd08b93725ef4c7006d3f7daafe710'
            '6e3c93fce73b04de31a381394c8db7a574de0eb69f76d93e65a430109a2bba23')

package() {
	install -d -m775 "${pkgdir}/opt/puck"
	install -D -m644  ${pkgname}-${pkgver}/puck.jar "${pkgdir}/opt/puck"
	install -d -m775 "${pkgdir}/usr/share/applications/"
	install -D -m644 "puck.desktop" "${pkgdir}/usr/share/applications/"
}
