# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-zomnibus_addon
_pkgname=tome-zomnibus
pkgver='17.7.16'
_pkgver='190'
pkgrel='1'
pkgdesc="ZOmnibus Addon for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("https://te4.org/sites/default/files/games-addons/${_pkgname}_${_pkgver}.teaa")
sha256sums=('dcc204713c58f5631c56e004597a58e0e522736b5ceeaf636c789d0b575b1537')
noextract=("${_pkgname}_${_pkgver}.teaa")

package() {

	install -Dm644 "${srcdir}/${_pkgname}_${_pkgver}.teaa" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaa"

}
