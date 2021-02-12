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

pkgver=0.2.2
source=("https://cryptowat.ch/desktop/download/linux/0.2.2")
sha256sums=('09bc832e19278882b18be57b559bf50c613b6879d8f412355357129bf8f4b633')

package(){
	# Extract package data
	install -Dm 775 "cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch_desktop"
}
