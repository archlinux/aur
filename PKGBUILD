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

pkgver=0.4.3_1
source=("https://cryptowat.ch/desktop/download/linux/0.4.3")
sha256sums=('15f21a6c0ce2c22caff36fcfac652c242ffbb43afec2dc48567f96807b752949')

package(){
	# Extract package data
        install -Dm 775 "cryptowatch_desktop" "${pkgdir}/usr/bin/cryptowatch"
        install -Dm644 "../cryptowatch.desktop" "${pkgdir}"/usr/share/applications/cryptowatch.desktop
        install -Dm644 "../cryptowatch.png" "${pkgdir}"/usr/share/pixmaps/cryptowatch.png
}
