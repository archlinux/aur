# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-zomnibus_addon
_pkgname=tome-zomnibus
pkgver='17.8.5'
_pkgver='198'
pkgrel='1'
pkgdesc="ZOmnibus Addon for tome4."
arch=('any')
url="https://te4.org/games/addons/tome/zomnibus-addon-pack"
license=('custom')
depends=('tome4>=1.7.4')
source=("https://te4.org/sites/default/files/games-addons/${_pkgname}_${_pkgver}.teaa")
sha256sums=('1db14d368263b9dfb8a43a204ecfb8a52d44ab9d58fe65dc7ee74661c7e37738')
noextract=("${_pkgname}_${_pkgver}.teaa")

package() {

	install -Dm644 "${srcdir}/${_pkgname}_${_pkgver}.teaa" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaa"

}
