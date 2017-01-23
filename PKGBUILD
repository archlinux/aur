# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-r-kiosk
pkgver=0.9.0
pkgrel=1
pkgdesc='Firefox extension that defaults to full screen, disables all menus, toolbars, key commands and right button menus'
url='https://addons.mozilla.org/en-US/firefox/addon/r-kiosk/'
arch=('any')
license=('MPL 1.1')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/1659/r_kiosk-${pkgver}-fx.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('80c1dae8a4923b90bea891e9654401bfd497260c18b6da045667897e35df57bb')

package() {
	install -Dm644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{4D498D0A-05AD-4fdb-97B5-8A0AABC1FC5B}.xpi"
}

