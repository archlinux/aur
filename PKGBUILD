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

pkgver=1.31.0beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.31.0-beta.1_amd64.deb")
sha256sums=('abcdc020e96b7a6cc42498ef5fe7df358587f5f34ac8072f264e755a3a3f8bc3')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
