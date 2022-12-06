pkgname=rusted-sokoban
pkgver=0.1.3
pkgrel=1
pkgdesc="Sokoban written in Rust"
arch=('x86_64')
url='https://github.com/denix666/sokoban'
license=('MIT')

source=('https://github.com/denix666/sokoban/releases/download/v0.1.3/sokoban.tar.gz'
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
sha256sums=('32aa8f45e6850e61bcf1344ea65b288009678eb6812e1dc935a403b253f5c225'
            '41a4230954171a5ea2005161ec742b095e3acb30b1be33225d687cee6728dae3'
            'e4619bf82ed2a581662e8d603d650b3aa8972a31a09bd4a859f5b048d8b48f4c')
