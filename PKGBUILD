# Maintainer: Amael <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.3.1
pkgrel=1
arch=('x86_64')
pkgdesc="Eqonomize! is a cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base' 'desktop-file-utils')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v1.3.1/eqonomize-1.3.1-bin.tar.gz"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v1.3.1/data/eqonomize.desktop")
sha256sums=('999ff4b0c382e3342e877fd66c11aa43df8a5f8951e7ec432eef7a71e2397836'
			'3c011e0820f85d5f25eefd7db5257fb11cd7effcc1a9eaea6a6dc12db9c5ad1a')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "eqonomize" "$pkgdir/usr/bin/eqonomize"
	chmod +x "$pkgdir/usr/bin/eqonomize"

	mkdir -p "$pkgdir/usr/share/applications"
	cp "eqonomize.desktop" "$pkgdir/usr/share/applications"
	chmod +x "$pkgdir/usr/share/applications/eqonomize.desktop"
}
