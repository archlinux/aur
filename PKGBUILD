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

pkgver=0.4.0
source=("https://cryptowat.ch/desktop/download/linux/0.4.0")
sha256sums=('c03501d069626484db46a4def00fdb82d9d1d408a528e5b64d51972be355a07f')

package(){
	# Extract package data
	install -Dm 775 "cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch_desktop"
}
