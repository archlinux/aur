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

pkgver=1.24.0beta.3
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.24.0-beta.3_amd64.deb")
sha256sums=('cd27e5bf10270a75c09b8ede1aa22af3dc41f529d0dfd04fd353db6a645aaa9d')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}
