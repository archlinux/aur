# Maintainer: kyndair <kyndair at gmail dot com>
# This requires the user to login into their tome account and download the DLC into the same folder as the PKGBUILD.

pkgname=tome4-ashes_of_urhrok
_pkgname=ashes-urhrok
pkgver='1.1.4'
pkgrel='2'
pkgdesc="Ashes of Urhok DLC for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("ashes-urhrok.teaac::te4://ashes-urhrok.teaac")
# don't download anything automatically
DLAGENTS+=("te4::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('53faf7d28906307a3ab31e7a07d37def1f12c885c7639e4c63028a25577bdb32')
noextract=(ashes-urhrok.teaac)

package() {

	install -Dm644 "${srcdir}/${_pkgname}.teaac" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaac"

}
