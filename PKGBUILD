pkgname=rusted-sokoban
pkgver=0.1.2
pkgrel=1
pkgdesc="Sokoban written in Rust"
arch=('x86_64')
url='https://github.com/denix666/sokoban'
license=('MIT')

source=('https://github.com/denix666/sokoban/releases/download/v0.1.2/sokoban.tar.gz'
	'rusted-sokoban_icon.png'
	'rusted-sokoban.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 sokoban ${pkgdir}/usr/local/games/${pkgname}/sokoban
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-sokoban_icon.png ${pkgdir}/usr/share/pixmaps/rusted-sokoban_icon.png
    install -D -m644 rusted-sokoban.desktop ${pkgdir}/usr/share/applications/rusted-sokoban.desktop
}
sha256sums=('4604325c05f7da8e4e2c77d06791fb491147807164de0078abaafe265aa2721d'
            '41a4230954171a5ea2005161ec742b095e3acb30b1be33225d687cee6728dae3'
            'e4619bf82ed2a581662e8d603d650b3aa8972a31a09bd4a859f5b048d8b48f4c')
