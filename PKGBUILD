# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=EnhancedSteam
pkgname=firefox-extension-enhancedsteam
pkgver=9.7
pkgrel=1
pkgdesc="Plugin for firefox that enhances the steam website and adds new functionality."
license=('GPL2')
arch=('any')
url="https://enhancedsteam.com/"
depends=("firefox")
makedepends=("unzip")
source=("https://firefox.enhancedsteam.com/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('f1213f42d25956b05830326abc6f6946d25a7f954936cee3368cb634e8d5542d')

package() {
	cd "${srcdir}"

	_extension_id="jid1-YdiFiTEkQgInxA@jetpack"
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
}
