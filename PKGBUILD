# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgrel=2
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('signal-desktop-beta')
_pkgver=6.7.0-beta.1
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('85c4084d2e96cdd0cd0f06091ae228166e1fdd094f8df60649f747e5122140c2')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
