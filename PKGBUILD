# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=EnhancedSteam
pkgname=firefox-extension-enhancedsteam
pkgver=9.6
pkgrel=1
pkgdesc="Plugin for firefox that enhances the steam website and adds new functionality."
license=('GPL2')
arch=('any')
url="https://enhancedsteam.com/"
depends=("firefox")
makedepends=("unzip")
source=("https://firefox.enhancedsteam.com/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('1a79f3b2f62138e58e0b3e966a19e0d9446e8d06af9095623e261b9b2f7c3890')

package() {
	cd "${srcdir}"

	_extension_id="jid1-YdiFiTEkQgInxA@jetpack"
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
}
