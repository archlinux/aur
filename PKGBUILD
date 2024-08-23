# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-zomnibus_addon
_pkgname=tome-zomnibus
pkgver='17.7.11'
_pkgver='185'
pkgrel='1'
pkgdesc="ZOmnibus Addon for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("https://te4.org/sites/default/files/games-addons/${_pkgname}_${_pkgver}.teaa")
sha256sums=('fc5484990338b945e74c4cd6f9fc68227c54cdc869e31234efd8fb204d4e66b8')
noextract=("${_pkgname}_${_pkgver}.teaa")

package() {

	install -Dm644 "${srcdir}/${_pkgname}_${_pkgver}.teaa" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaa"

}
