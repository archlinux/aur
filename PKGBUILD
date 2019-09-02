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
provides=('signal-desktop')

pkgver=1.27.1beta.7
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.27.1-beta.7_amd64.deb")
sha256sums=('b94e7bf0b60c1fa8c10b91641d0c2fa18ba985c52937db55eb4834c294a586a7')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
