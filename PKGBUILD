# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=hide_fixed_elements
_addon_version=1.2
_addon_id=910283
_addon_filename="${_addon_name}-${_addon_version}-an+fx.xpi"
_gecko_id="hidefixedelements@commonground.systems"

pkgname=firefox-extension-hide-fixed-elements
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension to hide position:fixed elements"
arch=('any')
url="https://github.com/andfarm/HideFixedElements"
license=('MIT')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('4fb639bbd5297a8d503d1f932b1d61dfd93f8543772761273114cfd45aabbf16')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
