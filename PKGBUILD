pkgname=dosbox-mario
pkgver=1.0
pkgrel=1
pkgdesc="Mario - old DOS game"
arch=("any")
url="http://www.dosgamesarchive.com"
license=('freeware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://image.dosgamesarchive.com/games/mario.zip'
    'dosbox-mario.png'
    'dosbox-mario.desktop'
    'dosbox-mario.conf'
)

md5sums=('0e48eb688615e66e3267c341adffb3cf'
         'c0cf3c5a00d05b5a380e0b292f8e0a11'
         'aa01366944258e0301b66423f581c864'
         '3837cb886e28a60e78d32438fe987689')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-mario
    install -D -m644 dosbox-mario.conf ${pkgdir}/usr/local/games/dosbox-mario/dosbox-mario.conf
    install -D -m644 dosbox-mario.png ${pkgdir}/usr/share/pixmaps/dosbox-mario.png
    install -D -m644 dosbox-mario.desktop ${pkgdir}/usr/share/applications/dosbox-mario.desktop
    install -D -m644 MARIO.EXE ${pkgdir}/usr/local/games/dosbox-mario/MARIO.EXE
}