# Maintainer: kyndair <kyndair at gmail dot com>
# This requires the user to login into their tome account and download the DLC into the same folder as the PKGBUILD.

pkgname=tome4-embers_of_rage
_pkgname=orcs
pkgver='1.1.10'
pkgrel='2'
pkgdesc="Embers of Rage DLC for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("orcs.teaac::te4://orcs.teaac")
# don't download anything automatically
DLAGENTS+=("te4::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('f9e5cd38221bd6484ee331d6615b4db3db0597db8796fba0346caa68247f4117')
noextract=(orcs.teaac)

package() {

	install -Dm644 "${srcdir}/${_pkgname}.teaac" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaac"

}
