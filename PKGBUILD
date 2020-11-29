# Maintainer: -=De/\/=-
pkgname=jdiamonds
pkgver=1.0
pkgrel=1
pkgdesc="JDiamonds is a jewel like game written in Java"
arch=('any')
url='https://games.os.vc'
license=('GPLv3')

depends=('java-runtime')

source=('https://games.os.vc/jgames/jdiamonds-1.0/jdiamonds.jar'
        'jdiamonds_icon.png'
        'jdiamonds.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/jdiamonds
    install -D -m644 jdiamonds_icon.png ${pkgdir}/usr/share/pixmaps/jdiamonds_icon.png
    install -D -m644 jdiamonds.desktop ${pkgdir}/usr/share/applications/jdiamonds.desktop
    install -D -m644 jdiamonds.jar ${pkgdir}/usr/local/games/jdiamonds/jdiamonds.jar
}

md5sums=('7d19dc1d292cd71cb7026968894a6f7b'
         '7dbe50a3a109e19c8cca9c6e524cce56'
         'decae5c71961a5bf911e7b283fae0866')
