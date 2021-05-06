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

pkgver=5.1.0beta.6
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.1.0-beta.6_amd64.deb")
sha256sums=('0d13d1737c9a9fc8bb938304df3724a16b1e222cafce9681d7c9f82de9a91159')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
