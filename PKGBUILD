# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=2.1
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep2-win64-${pkgver}.zip")
sha256sums=('ae4848bcdbcd3671d427a7faa6e3bb9ccd9bd2f89375fb9f4017ee12bda84599')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
