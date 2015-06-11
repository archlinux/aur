# Maintainer: Auguste Pop < auguste [at] gmail [dot] com >
# Contributor: SanskritFritz (gmail)
# Contributor: SiD/sidious <miste78 web de>

pkgname=hodoku
pkgver=2.2.0
pkgrel=1
pkgdesc="Sudoku generator/solver/analyzer"
url="http://hodoku.sourceforge.net/en/index.php"
license=('GPL3')
arch=('any')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/${pkgname}_${pkgver}/$pkgname.jar
        $pkgname.sh
        $pkgname.png
        $pkgname.desktop)
noextract=($pkgname.jar)
md5sums=('fa8d728b76f524b97762f4fe0b82152a'
         '883f82c99d42ad5113e84c6a501a66b5'
         '01d77a4d9f4fd1fb36690ee8a3bae6c4'
         '557ca158902fddf06cbda7c7c9480c08')

package()
{
    cd "$srcdir"
    install -m 644 -D $pkgname.jar \
        "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -m 755 -D $pkgname.sh \
        "$pkgdir/usr/bin/$pkgname"
    install -m 644 -D $pkgname.png \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -m 644 -D $pkgname.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
}
