# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=chess-merida
pkgver=1.1
pkgrel=2
pkgdesc='A truetype chess font for diagrams and figurine notation'
arch=(any)
url='http://www.enpassant.dk/chess/fonteng.htm'
license=('custom')
source=('https://www.enpassant.dk/chess/downl/merid_tt.zip')
md5sums=('fdd8933e38932cf91d971c0667f1d0b5')
sha1sums=('d8ce5ffb045a7eeab4544b5dc0d7c709aa62593d')
sha256sums=('ad2f619551660ebb65b0d1e4c7a487db108ac72235bbd53f47a402d2144587e7')

package() {
	cd $srcdir
	install -m644 -D MERIFONT.TTF $pkgdir/usr/share/fonts/TTF/ChessMerida.ttf
	install -m644 -D README_D.TXT $pkgdir/usr/share/licenses/$pkgname/README
}
