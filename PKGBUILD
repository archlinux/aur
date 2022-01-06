# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('signal-desktop-beta')

pkgver=5.28.0beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.28.0-beta.1_amd64.deb")
sha256sums=('f188439abaa73a695c81305ddbc4295a7145fec03a8a9b3b7a907809f755b9ef')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
