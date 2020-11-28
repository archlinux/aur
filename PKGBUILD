# Maintainer: -=De/\/=-
pkgname=jtetris
pkgver=1.0.1
pkgrel=1
pkgdesc="JTetris is a teris written in Java"
arch=('any')
url='https://games.os.vc'
license=('GPLv3')

depends=('java-runtime')

source=('https://games.os.vc/jgames/jtetris-1.0.1/jtetris.jar'
        'jtetris_icon.png'
        'jtetris.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/jtetris
    install -D -m644 jtetris_icon.png ${pkgdir}/usr/share/pixmaps/jtetris_icon.png
    install -D -m644 jtetris.desktop ${pkgdir}/usr/share/applications/jtetris.desktop
    install -D -m644 jtetris.jar ${pkgdir}/usr/local/games/jtetris/jtetris.jar
}

md5sums=('cd85c0d54518c2056e53ed146b470f96'
         '73d9effac6a596c7b7bdac0117c26eab'
         '3306f16ab62b8915334880caa4141929')
