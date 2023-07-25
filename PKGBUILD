# Maintainer: kyndair <kyndair at gmail dot com>

pkgname=tome4-zomnibus_addon
_pkgname=tome-zomnibus
pkgver='17.7.1'
_pkgver='175'
pkgrel='1'
pkgdesc="ZOmnibus Addon for tome4."
arch=('any')
url="https://te4.org/"
license=('custom')
depends=('tome4>=1.7.4')
source=("https://te4.org/sites/default/files/games-addons/${_pkgname}_${_pkgver}.teaa")
sha256sums=('ce479dfa62890291af30e21cf23e91dcd1bed5ad76255e885eb235b150037b87')
noextract=("${_pkgname}_${_pkgver}.teaa")

package() {

	install -Dm644 "${srcdir}/${_pkgname}_${_pkgver}.teaa" "${pkgdir}/opt/tome4/game/addons/${_pkgname}.teaa"

}
