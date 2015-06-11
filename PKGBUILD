# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=chess-merida
pkgver=1.1
pkgrel=1
pkgdesc="A truetype chess font for diagrams and figurine notation"
arch=('any')
url="http://www.enpassant.dk/chess/fonteng.htm"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=merida.install
source=("http://www.enpassant.dk/chess/downl/merid_tt.zip"
        'merida.install')
md5sums=('fdd8933e38932cf91d971c0667f1d0b5'
         '5ae0a6e3a2b9dd955467c59f8276e5c6')

package()
{
    cd $srcdir
    install -m 644 -D MERIFONT.TTF \
        $pkgdir/usr/share/fonts/TTF/ChessMerida.ttf
    install -m 644 -D README_D.TXT \
        $pkgdir/usr/share/licenses/$pkgname/README
}
