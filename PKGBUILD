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

pkgver=1.25.0beta.6
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.25.0-beta.6_amd64.deb")
sha256sums=('a0b5dc9fea669ed0822021fed486eed7025fdd9bb1c6bd6c88649774ffb5ec8e')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
