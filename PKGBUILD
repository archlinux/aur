# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=undo_close_tab_button
_addon_version=1.7
_addon_id=630686
_addon_filename="${_addon_name}-${_addon_version}-an+fx.xpi"
_gecko_id="undo-close-tab-buttons-single@codefisher.org"

pkgname=firefox-extension-undo-close-tab-button
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension that adds toolbar buttons for quick access to undo the closing of tabs "
arch=('any')
url="https://codefisher.org/toolbar_button/button/undo-close-tab/"
license=('GPL3')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('9ff039eafcafc9590bf2b615917347e3fc42be814ed0fbbd01216ca257b166c2')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
