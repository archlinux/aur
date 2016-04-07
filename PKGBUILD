pkgname=dosbox-prince-of-persia
pkgver=1.0
pkgrel=1
pkgdesc="Prince of persia - old DOS game"
arch=("any")
url="http://www.bestoldgames.net/eng/"
license=('Abandonware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://www.bestoldgames.net/download/bgames/prince-of-persia.zip'
    'dosbox-prince-of-persia.png'
    'dosbox-prince-of-persia.desktop'
    'dosbox-prince-of-persia.conf'
)

md5sums=('5750420547a6739ffaa9b07cd74923ef'
         'dca719b74d10b38a2ba080e1db580d68'
         'dbdb77177064fe8b86fdab039ee1690d'
         'c3500c252e85bb78df2499fbc2370c25')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-prince-of-persia
    install -D -m644 dosbox-prince-of-persia.conf ${pkgdir}/usr/local/games/dosbox-prince-of-persia/dosbox-prince-of-persia.conf
    install -D -m644 dosbox-prince-of-persia.png ${pkgdir}/usr/share/pixmaps/dosbox-prince-of-persia.png
    install -D -m644 dosbox-prince-of-persia.desktop ${pkgdir}/usr/share/applications/dosbox-prince-of-persia.desktop

    cp -r $srcdir/Prince/* ${pkgdir}/usr/local/games/dosbox-prince-of-persia
}
