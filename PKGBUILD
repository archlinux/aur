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

pkgver=1.27.1beta.5
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.27.1-beta.5_amd64.deb")
sha256sums=('df50362cb7e8f4a545cd1aa2ad8b949816d08e0e40e831fe5f1d02dbcbb65989')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
