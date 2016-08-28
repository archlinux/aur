# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=1.3.1
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep1-win32-${pkgver}.zip")
sha256sums=('939423f9cc4db8f6bf5335636988ab42fab4a36ab056a2c9ad2a4ee843f664b1')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
