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
_pkgver=5.42.0-beta.1
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('4c273c69963a302ca566848a1d1c40ca01f5eb487bff719fd5e005847859d6ec')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
