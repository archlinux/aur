# Maintainer: -=De/\/=-
# Author: -=De/\/=-
pkgname=pyxenon
pkgver=0.1
pkgrel=1
pkgdesc="Pyxenon - xenon like game preview written in python"
arch=('x86_64')
url='https://games.os.vc'
license=('GPLv3')

source=('https://games.os.vc/pygames/pyxenon-0.1/pyxenon.tar.gz'
        'pyxenon.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/pyxenon
    install -d -m755 ${pkgdir}/usr/local/bin
    install -D -m644 pyxenon.desktop ${pkgdir}/usr/share/applications/pyxenon.desktop
    install -D -m755 pyxenon ${pkgdir}/usr/local/bin/pyxenon
    install -D -m755 main.bin ${pkgdir}/usr/local/games/pyxenon/main.bin
    install -D -m644 game_font.ttf ${pkgdir}/usr/local/games/pyxenon/game_font.ttf
    
    cp -r images ${pkgdir}/usr/local/games/pyxenon/
    cp -r sounds ${pkgdir}/usr/local/games/pyxenon/
    
}
sha256sums=('23b53a662e5d68bd54e0336518b74d5d5d0ddad0cc7d5d2656e77717ac1dad7f'
            '6124c10735be364fa02c5dbcd33d1647e3a65119f7241151d3eba389033b9b21')
