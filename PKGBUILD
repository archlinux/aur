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

pkgver=5.11.0beta.3
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.11.0-beta.3_amd64.deb")
sha256sums=('d97ff15091680a814f0a3cbabd80f261f335090c7e98df44caf140f3280d3239')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
