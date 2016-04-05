pkgname=dosbox-superkarts
pkgver=1.0
pkgrel=1
pkgdesc="Superkarts - old DOS game"
arch=("any")
url="http://www.bestoldgames.net/eng/"
license=('abandonware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://www.bestoldgames.net/download/bgames/superkarts.zip'
    'dosbox-superkarts.png'
    'dosbox-superkarts.desktop'
    'dosbox-superkarts.conf'
)

md5sums=('ecbe252384633c287ba36ba3e370236d'
         'cb2b4f1416955fa715430ecec3694134'
         '073341a96df2150891a9eea35c108f91'
         'af93f0318edaca1ff91c121938b8f3b3')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-superkarts
    install -D -m644 dosbox-superkarts.conf ${pkgdir}/usr/local/games/dosbox-superkarts/dosbox-superkarts.conf
    install -D -m644 dosbox-superkarts.png ${pkgdir}/usr/share/pixmaps/dosbox-superkarts.png
    install -D -m644 dosbox-superkarts.desktop ${pkgdir}/usr/share/applications/dosbox-superkarts.desktop

    install -D -m644 $srcdir/SuperKarts/KART.EXE ${pkgdir}/usr/local/games/dosbox-superkarts/KART.EXE
    install -D -m644 $srcdir/SuperKarts/KART.DAT ${pkgdir}/usr/local/games/dosbox-superkarts/KART.DAT
}