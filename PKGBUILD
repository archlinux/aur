# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=puck
pkgver="2.3.65"
_weird_number="260"
pkgrel=1
pkgdesc="Program for the use and computation of kinship data"
arch=(any)
url="https://www.kintip.net/"
license=('GPL')
depends=(jre7)
source=("https://www.kintip.net/component/jdownloads/send/3-logiciels/${_weird_number}-${pkgname}-${pkgver//\./\-}"
	"puck.desktop")
noextract=()
sha256sums=('cf5dd82634d66ceb08df146527a65577491fd3eab7d330bfceb7ec0498e1a70c'
            '6e3c93fce73b04de31a381394c8db7a574de0eb69f76d93e65a430109a2bba23')

package() {
	install -d -m775 "${pkgdir}/opt/puck"
	install -D -m644  ${pkgname}-${pkgver}/puck.jar "${pkgdir}/opt/puck"
	install -d -m775 "${pkgdir}/usr/share/applications/"
	install -D -m644 "puck.desktop" "${pkgdir}/usr/share/applications/"
}
