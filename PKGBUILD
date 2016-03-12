# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=1.3
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep1-win32-${pkgver}.zip")
sha256sums=('d0487d9109c4c5016a32b7e1b542c159c329b4ec8f0d89990be8314d8a61fcba')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
