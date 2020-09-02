# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgrel=2
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('signal-desktop-beta')

pkgver=1.35.1beta.3
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.35.1-beta.3_amd64.deb")
sha256sums=('86a9b4bbb5839a0f00a6c08f2d5d71449d0724df8ebbd6edd1d106ea95dd2a9d')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}