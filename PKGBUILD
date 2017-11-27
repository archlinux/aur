# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-quickdial
pkgver=0.1.13
pkgrel=1
pkgdesc='Firefox dial page inspired from fast dial'
url='https://addons.mozilla.org/en-US/firefox/addon/quick-dial/'
arch=('any')
license=('MPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/860405/quick_dial-${pkgver}-an+fx-linux.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('e8c99a6b2f7ded65ac2472cf93c462a0bed55f5e7591ac751a2f5f3399552b4d')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/quickdial@matmoul.com.xpi"
}

