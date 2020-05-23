# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Edited from: firefox-extension-https-everywhere

_plugin_name=canvasblocker
_plugin_version=1.2
_plugin_id=534930
_plugin_ext="an+fx"
pkgname='firefox-extension-canvasblocker'
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Plugin for firefox that prevents canvas fingerprinting to prevent tracking."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/${_plugin_name}-${_plugin_version}-${_plugin_ext}.xpi")
noextract=("${_plugin_name}-${_plugin_version}-${_plugin_ext}.xpi")
sha256sums=('8666579a1a005bf0f0588202422c38ab35b12ede2755de864df7a9f69f5e040a')

package() {
	install -Dm644 "${_plugin_name}-${_plugin_version}-${_plugin_ext}.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"
}
