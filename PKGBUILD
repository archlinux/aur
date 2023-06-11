# Maintainer: kyndair <kyndair at gmail dot com>
# This requires the user to login into their tome account and download the DLC into the same folder as the PKGBUILD.

pkgname=tome4-forbidden_cults
_pkgname=cults
pkgver='1.0.12'
pkgrel='2'
pkgdesc="Forbidden Cults DLC for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("cults.teaac::te4://cults.teaac")
# don't download anything automatically
DLAGENTS+=("te4::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('b495424023ef1e186467d84eef3872c785cd354c0130924875669e36a30bf723')
noextract=(cults.teaac)

package() {

	install -Dm644 "${srcdir}/${_pkgname}.teaac" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaac"

}
