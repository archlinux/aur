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

pkgver=5.4.0beta.4
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.4.0-beta.4_amd64.deb")
sha256sums=('ee77ea843811f8039ebf18354bf9192787bcc7dd164bfb0f96fb423c2c1992c1')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
