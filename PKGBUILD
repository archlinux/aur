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
provides=('signal-desktop-beta')

pkgver=1.34.3beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.34.3-beta.1_amd64.deb")
sha256sums=('8ac6037f5370cbcd4a66b6bfd176ac733a706f9e6c856085b883a8f6afdeb081')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
