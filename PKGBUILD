# Maintainer: Djuice <felhamed@gmail.com>
pkgname=cryptowatch-desktop-bin
pkgrel=1
pkgdesc="Charting & trading terminal for cryptocurrency markets"
arch=('x86_64')
url="https://cryptowat.ch/apps/desktop"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
provides=('cryptowatch-desktop-bin')

pkgver=0.3.3
source=("https://cryptowat.ch/desktop/download/linux/0.3.3")
sha256sums=('08cee3856e86439bc715e8ab83a81ba49dfe92eba6bc887f482913612d0ec659')

package(){
	# Extract package data
	install -Dm 775 "cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch_desktop"
}
