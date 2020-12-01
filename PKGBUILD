# Maintainer: -=De/\/=-
pkgname=jsnake
pkgver=2.0.0
pkgrel=1
pkgdesc="JSnake is a snake written in Java"
arch=('any')
url='https://games.os.vc'
license=('GPLv3')

depends=('java-runtime')

source=('https://games.os.vc/jgames/jsnake-2.0.0/jsnake.jar'
        'jsnake_icon.png'
        'jsnake.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/jsnake
    install -D -m644 jsnake_icon.png ${pkgdir}/usr/share/pixmaps/jsnake_icon.png
    install -D -m644 jsnake.desktop ${pkgdir}/usr/share/applications/jsnake.desktop
    install -D -m644 jsnake.jar ${pkgdir}/usr/local/games/jsnake/jsnake.jar
}

md5sums=('6c44e1d897c0d05100b2085fbdcf75ba'
         '27f37cfefb7a74155b0a862226d8d587'
         '15f466bf405343529557409bd83144b2')
