# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=1.4
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep1-win32-${pkgver}.zip")
sha256sums=('7752a552c974f38bd345de250d3606ed164d503281be125785e3bda0f0f71a37')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
