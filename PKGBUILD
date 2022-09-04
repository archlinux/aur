## Maintainer: Carlo Sala <carlosalag@protonmail.com>

pkgname=slimbooksensortouchpad
pkgver=0.3
pkgrel=1
pkgdesc="Set your touchpad. On/Off in your touchpad!"
arch=('any')
url="https://slimbook.es"
license=('GPL v3')
depends=('xbindkeys')
backup=('etc/sudoers.d/slimbooksensortouchpad-sudo')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://launchpadlibrarian.net/618501097/slimbooksensortouchpad_0.3_all.deb")
sha512sums=('198bb80afb84df4fca2a88a7dd3625e13d0a798b2417be0b4fbf5ae511c05fa77a7a83e4e1a6b1ca6f58a248c10c1f6088c21e69d2a52983528f0853dcb4c5d1')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/slimbooksensortouchpad/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
