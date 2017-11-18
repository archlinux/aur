# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-quickdial
pkgver=0.1.8
pkgrel=3
pkgdesc='Firefox dial page inspired from fast dial'
url='https://addons.mozilla.org/en-US/firefox/addon/quick-dial/'
arch=('any')
license=('MPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/860405/quick_dial-${pkgver}-an+fx-linux.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('0f8f4c92256a8e9ec307046ab1b56ab329698e6efe01d318791de08487f19c14')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/quickdial@matmoul.com.xpi"
}

