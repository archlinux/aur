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
_pkgver=6.5.0-beta.2
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('7005fda14ddb26b4ce1f745b6df50afb8f4e89148b8c464b76924d38c01af782')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
