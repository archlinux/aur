# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.176
pkgrel=1
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=('https://code2001.com/CODE2000.ZIP')
md5sums=('6a6e8edee9171946ff2b32b8086d9b2d')
sha256sums=('39fc2bed4963bdb714425af183e7ad12857f578ef5cf439998ed6df23646c482')
sha512sums=('e19f2c16f7abd6df4c5470d188a332e8d57096491129becf256f853bd810108515a08080ab64b4a141261462624d75dd7fc894864cc492d341ebdb5cc7dbf2e8')

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
}
