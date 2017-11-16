# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-gesturefy
pkgver=1.1.4
pkgrel=1
pkgdesc='firefix addon for customizable mouse gesture, which supports over 40 different actions'
url='https://addons.mozilla.org/en-US/firefox/addon/gesturefy/'
arch=('any')
license=('GPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/770694/${pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('23f095d21e1706d18d659a3adca80c37deca10d1b9aa3b209ee2b8eb7c91459f')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{506e023c-7f2b-40a3-8066-bc5deb40aebe}.xpi"
}

