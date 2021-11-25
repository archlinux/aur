# Maintainer: Nemo <archlinux at captnemo dot in>
# WARNING: This version corrupted my signal-beta database. I recommend taking a backup of
# "~/.config/Signal Beta" before upgrading.
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

pkgver=5.25.0beta.2
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_5.25.0-beta.2_amd64.deb")
sha256sums=('71b88e7bca116e2c878ce4b66f0b1ac0d216653b86577654257602c0a9071bbc')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
