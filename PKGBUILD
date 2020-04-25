# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=youtube_classic
_addon_version=1.4.1
_addon_id=969546
_addon_filename="${_addon_name}-${_addon_version}-fx.xpi"
_gecko_id="{6acd0f4d-ab79-4b79-9b28-8bde65ae355c}"

pkgname=firefox-extension-youtube-classic
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension that restores the classic YouTube look (version for Firefox)"
arch=('any')
url="https://github.com/thisdotvoid/youtube-classic-extension"
license=('MPL2')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('58d370bdd1a6fa9e5703e889152698cbc87cc60eba84c5375cdcbae366aee63e')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
