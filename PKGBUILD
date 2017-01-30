# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-keybinder
pkgver=2.0.4
pkgrel=1
pkgdesc='Firefox extension to customize, override or disable almost any shortcut'
url='https://addons.mozilla.org/en-US/firefox/addon/keybinder/'
arch=('any')
license=('MPL 2.0')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/538504/keybinder-${pkgver}-fx.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('45cafe34c36806949d403cdc7acad9b211e4c6f126a9fad09d85372582a597ea')

package() {
	install -Dm644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/keybinder@fail.cl.xpi"
}

