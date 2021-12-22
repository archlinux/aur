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

pkgver=5.27.0beta.3
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.27.0-beta.3_amd64.deb")
sha256sums=('1e6d1ecfaf182102c5dba0e06f6b6a199a1af2e47fb375c53d107f2e3a2954e8')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
