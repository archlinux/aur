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

pkgver=1.39.5beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.39.5-beta.1_amd64.deb")
sha256sums=('b76423e3edaf10cb25fbfdf4c5ce3ba5256f5972c3863f75c3b55b63ae12f2dc')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}