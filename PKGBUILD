# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-gesturefy
pkgver=2.0.1
pkgrel=1
pkgdesc='firefix addon for customizable mouse gesture, which supports over 40 different actions'
url='https://addons.mozilla.org/en-US/firefox/addon/gesturefy/'
arch=('any')
license=('GPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/819184/gesturefy-${pkgver}-an+fx-linux.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('90ff807e403ce64822f8dc8e7babc12cbe0ff1e0b1424165e5c1f34e8ae58a72')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{506e023c-7f2b-40a3-8066-bc5deb40aebe}.xpi"
}

