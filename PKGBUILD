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

pkgver=0.3.1
source=("https://cryptowat.ch/desktop/download/linux/0.3.1")
sha256sums=('6a5e52b2733d07ccc8f7d58313b6ebaf7529e61cd11549e842fa20ff0b4c7a03')

package(){
	# Extract package data
	install -Dm 775 "cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch_desktop"
}
