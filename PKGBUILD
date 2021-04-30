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

pkgver=5.1.0beta.5
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.1.0-beta.5_amd64.deb")
sha256sums=('0add4f36cc5cc66cd583d86d44f9afe68d7ac7e44d0aa2c2c5bf317c64e997b3')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
