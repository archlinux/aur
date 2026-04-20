# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-zomnibus_addon
_pkgname=tome-zomnibus
pkgver='17.8.14'
_pkgver='207'
pkgrel='1'
pkgdesc="ZOmnibus Addon for tome4."
arch=('any')
url="https://te4.org/games/addons/tome/zomnibus-addon-pack"
license=('custom')
depends=('tome4>=1.7.4')
source=("https://te4.org/sites/default/files/games-addons/${_pkgname}_${_pkgver}.teaa")
sha512sums=('f39f91b4ae21effa3f2a58360a08ff8d05cd655d2fb843bdb40d77b577149c735becc56c1f7c4440f6d974addc2acac207a246a5bdea2cdeaf4d7d4614379bcc')
noextract=("${_pkgname}_${_pkgver}.teaa")

package() {

	install -Dm644 "${srcdir}/${_pkgname}_${_pkgver}.teaa" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaa"

}
