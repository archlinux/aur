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

pkgver=5.0.0beta.4
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.0.0-beta.4_amd64.deb")
sha256sums=('d1e7de57e0e6491d3dd298d5b97979a96c5dc6f63fc0f7a6395641fb44d77733')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
