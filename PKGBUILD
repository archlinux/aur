# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=1.3.2
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep1-win32-${pkgver}.zip")
sha256sums=('b91cbd85bef44ff6faf77103ae34597e787141a13655f21ac4312f0d0f468ac9')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
