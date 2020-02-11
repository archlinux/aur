# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=session-desktop-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/loki-project/session-desktop"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('session-desktop-bin')

pkgver=1
source=("https://getsession.org/linux")
sha256sums=('183bdad43604997ae63548839b814f29d4accb659c148f60e6309dfe2c9d661e')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

