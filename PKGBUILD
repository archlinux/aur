# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=square1-wad
pkgver=2.0
pkgrel=1
pkgdesc="The Adventures of Square, Episode 1 game data"
arch=('any')
url='http://adventuresofsquare.com/'
license=('CCPL:by-nc' 'MIT')
source=("http://adventuresofsquare.com/downloads/square-ep2-win64-${pkgver}.zip")
sha256sums=('9ce8d75386833e7dc1a6f25c31aed18dff44a18f365d3f8bf6bef6f2f5e92117')

package() {
    install -D -m644 'square1.pk3' "${pkgdir}/usr/share/doom/square1.pk3"

    install -D -m644 'SQUARE-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/SQUARE-LICENSE.txt"
}
