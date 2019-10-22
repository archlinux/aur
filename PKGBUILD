# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-gesturefy
pkgver=2.1.2
pkgrel=1
pkgdesc='firefix addon for customizable mouse gesture, which supports over 40 different actions'
url='https://addons.mozilla.org/firefox/addon/gesturefy/'
arch=('any')
license=('GPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/819184/gesturefy-${pkgver}-fx.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('c3a4eb60fcadab4bb7f6cb262389313b43bc6c1bbdfd74a30190f395132007c2')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{506e023c-7f2b-40a3-8066-bc5deb40aebe}.xpi"
}

