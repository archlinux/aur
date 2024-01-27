# Maintainer:  SanskritFritz (gmail)
# Contributor: Auguste Pop < auguste [at] gmail [dot] com >
# Contributor: SiD/sidious <miste78 web de>

pkgname=hodoku
_pkgver=2.3.2-WIP
pkgver=2.3.2_WIP
pkgrel=1
pkgdesc="Sudoku generator/solver/analyzer"
url="https://github.com/PseudoFish/Hodoku/"
license=('GPL3')
arch=('any')
depends=('java-runtime')
source=("https://github.com/PseudoFish/Hodoku/releases/download/$_pkgver/Hodoku.jar"
        $pkgname.sh
        $pkgname.png
        $pkgname.desktop)
noextract=($pkgname.jar)
md5sums=('f6ea6bd1fa98d90c9462a007ad4e84d4'
         '6b02d39a3c75a162c236d997eaf270fe'
         '01d77a4d9f4fd1fb36690ee8a3bae6c4'
         '557ca158902fddf06cbda7c7c9480c08')

package()
{
    cd "$srcdir"
    install -m 644 -D Hodoku.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -m 755 -D $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -m 644 -D $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -m 644 -D $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
