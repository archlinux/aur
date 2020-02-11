# Maintainer: Ewhal 
pkgname=session-desktop-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/loki-project/session-desktop"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('session-desktop-bin')

pkgver=1.0.1
source=("https://github.com/loki-project/session-desktop/releases/download/v${pkgver}/session-messenger-desktop-linux-${pkgver}.deb")
sha256sums=('513FB9C0E5DC25DF1743BD03D31BA5E3B385FAA639309FD14B7BFCDB11FA20B3')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

