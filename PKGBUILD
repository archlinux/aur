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

pkgver=1.40.0beta.7
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.40.0-beta.7_amd64.deb")
sha256sums=('86efd88f6cd8aaef26c4062832ca99c9c7cb81e7be1b88f4b46bcefaa490b68e')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}