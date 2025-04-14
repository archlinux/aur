# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=hide_fixed_elements
_addon_version=1.4
_file_id=4194227
_addon_filename="${_addon_name}-${_addon_version}.xpi"
_gecko_id="hidefixedelements@commonground.systems"

pkgname=firefox-extension-hide-fixed-elements
pkgver="${_addon_version}"
pkgrel=1
pkgdesc="Browser extension to hide position:fixed elements"
arch=(any)
url="https://github.com/andfarm/HideFixedElements"
license=(MIT)
depends=(firefox)
source=("${_addon_filename}::https://addons.mozilla.org/firefox/downloads/file/${_file_id}")
noextract=("${_addon_filename}")
sha256sums=(2f7bd5c1408ef9ada8dd6a344882b6293607a937bc42c4795c63cfc6c0bfc37b)

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
