# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-quickdial
pkgver=0.1.10
pkgrel=1
pkgdesc='Firefox dial page inspired from fast dial'
url='https://addons.mozilla.org/en-US/firefox/addon/quick-dial/'
arch=('any')
license=('MPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/860405/quick_dial-${pkgver}-an+fx-linux.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('fc7ac7e4baa4240ee2496f0472b12fd4b9ca6d05f8912f2e2b3a60303f79fd25')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/quickdial@matmoul.com.xpi"
}

