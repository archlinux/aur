# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname='canvasblocker-0.4.0.2-an+fx'
pkgname='firefox-extension-canvasblocker'
pkgver=0.4.0.2
pkgrel=1
pkgdesc="Plugin for firefox that prevents canvas fingerprinting to prevent tracking."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/534930/$_pkgname.xpi")
noextract=("$_pkgname.xpi")
sha256sums=('21bc3d0d5754ea3c19384fe1a7af210990010ef935bab08f065886979a99fd06')

package() {
	install -Dm644 "$_pkgname.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"
}
