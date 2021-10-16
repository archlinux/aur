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

pkgver=5.21.0beta.2
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.21.0-beta.2_amd64.deb")
sha256sums=('8a227d14103b8f8a9131d020d98545067c0415ab2a4ba9399ea63741e3f55859')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
