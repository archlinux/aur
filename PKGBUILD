# Maintainer: -=De/\/=-
pkgname=javanoid
pkgver=1.0.1
pkgrel=1
pkgdesc="Javanoid is an arkanoid clone written in Java"
arch=('any')
url='https://games.os.vc'
license=('GPLv3')

depends=('java-runtime')

source=('https://games.os.vc/jgames/javanoid-1.0/javanoid.jar'
        'javanoid_icon.png'
        'javanoid.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/javanoid
    install -D -m644 javanoid_icon.png ${pkgdir}/usr/share/pixmaps/javanoid_icon.png
    install -D -m644 javanoid.desktop ${pkgdir}/usr/share/applications/javanoid.desktop
    install -D -m644 javanoid.jar ${pkgdir}/usr/local/games/javanoid/javanoid.jar
}

md5sums=('bb8fe71b73811e9ef97ef5f883728c4e'
         '6d4a2c9a141cb8f80986f0998bea9187'
         '66e8e32ed549519bed78802fb0e79313')
