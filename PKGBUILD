# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('signal-desktop')

pkgver=1.23.2beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.23.2-beta.1_amd64.deb")
sha256sums=('dd03086427aaef5a4c0c8bb88943ba097e027f3eb22fa2d348e7b6b6ad169b84')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
