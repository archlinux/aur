# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=firefox-extension-amber
pkgver=1.21
pkgrel=1
pkgdesc='Bring the Unix philosophy to the browser.'
arch=(x86_64)
url="https://github.com/paysonwallach/amber-web-extension/"
license=('GPL')
source=("https://paysonwallach.com/amber/amber-${pkgver}.xpi")
noextract=("amber-${pkgver}.xpi")
sha256sums=('6a05282b2a7b71edc0cc8f3f6e7eb9af2b7cd29a0639e57812c6eadaf8b43330')

package() {
	depends=('firefox')

	_extension_id='amber@paysonwallach.com'
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	install -Dm644 "${srcdir}/amber-${pkgver}.xpi" "${_extension_dest}.xpi"
}
