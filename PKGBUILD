# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=tab_session_manager
_addon_version=5.2.0
_addon_id=859942
_addon_filename="${_addon_name}-${_addon_version}-fx.xpi"
_gecko_id="Tab-Session-Manager@sienori"

pkgname=firefox-extension-tab-session-manager
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Firefox extension to save and restore the state of windows and tabs"
arch=('any')
url="https://github.com/sienori/Tab-Session-Manager"
license=('MPL2')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('d8dcf2f0bc0f76fd4c7e10672259622e9689e4af4b39808de9d466f276fb6683')


package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
