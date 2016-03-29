pkgname=dosbox-gobman
pkgver=1.0
pkgrel=1
pkgdesc="Gobman - old DOS game"
arch=("any")
url="http://www.dosgamesarchive.com"
license=('shareware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://image.dosgamesarchive.com/games/gobman11.zip'
    'dosbox-gobman.png'
    'dosbox-gobman.desktop'
    'dosbox-gobman.conf'
)

md5sums=('ce9bbc0101cffebd92b3d08a41f63d8c'
         '7dd21ea980bff7b5a399cd039c90cf66'
         '4a9351ca4d731803b82024b9492ee90a'
         'f0420bc16375fea1224db81c1cebd6a5')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-gobman
    install -D -m644 dosbox-gobman.conf ${pkgdir}/usr/local/games/dosbox-gobman/dosbox-gobman.conf
    install -D -m644 dosbox-gobman.png ${pkgdir}/usr/share/pixmaps/dosbox-gobman.png
    install -D -m644 dosbox-gobman.desktop ${pkgdir}/usr/share/applications/dosbox-gobman.desktop
    install -D -m644 GOBMAN.EXE ${pkgdir}/usr/local/games/dosbox-gobman/GOBMAN.EXE
}