# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname='canvasblocker-0.5.8-an+fx'
pkgname='firefox-extension-canvasblocker'
pkgver=0.5.8
pkgrel=1
pkgdesc="Plugin for firefox that prevents canvas fingerprinting to prevent tracking."
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/534930/$_pkgname.xpi")
noextract=("$_pkgname.xpi")
sha256sums=('92fcb44c96c13c9b85d0403a48baf7dcadd3a421250981d5a489da16c6d2b4a5')

package() {
	install -Dm644 "$_pkgname.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CanvasBlocker@kkapsner.de.xpi"
}
