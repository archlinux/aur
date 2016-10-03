# Maintainer: Antoni Boucher <bouanto [at] zoho [dot] com>

pkgname=chess-merida-unicode
pkgver=1.1
pkgrel=1
pkgdesc="A truetype chess font for diagrams and figurine notation"
arch=('any')
url="http://mip.noekeon.org/HTMLTTChess/chess_merida_unicode.html"
license=('custom')
source=("https://github.com/xeyownt/htmlttchess/raw/master/chess_merida_unicode.ttf"
    "https://github.com/xeyownt/htmlttchess/raw/master/COPYING")
md5sums=('707494358789579b59d80fc073ddea91'
    'a23a74b3f4caf9616230789d94217acb')

package()
{
    cd $srcdir
    install -m 644 -D chess_merida_unicode.ttf \
        $pkgdir/usr/share/fonts/TTF/ChessMeridaUnicode.ttf
    install -m 644 -D COPYING \
        $pkgdir/usr/share/licenses/$pkgname/README
}
