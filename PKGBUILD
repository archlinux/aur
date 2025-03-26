pkgname=rusted-sokoban
pkgver=0.1.5
pkgrel=1
pkgdesc="Sokoban written in Rust"
arch=('x86_64')
url='https://github.com/denix666/sokoban'
license=('MIT')

source=('https://github.com/denix666/sokoban/releases/download/v0.1.5/sokoban.tar.gz'
	'rusted-sokoban_icon.png'
	'rusted-sokoban.desktop')

package() {
    cd ${srcdir}
    install -D -m755 sokoban ${pkgdir}/usr/bin/sokoban
    install -D -m644 rusted-sokoban_icon.png ${pkgdir}/usr/share/pixmaps/rusted-sokoban_icon.png
    install -D -m644 rusted-sokoban.desktop ${pkgdir}/usr/share/applications/rusted-sokoban.desktop
}

sha256sums=('470b866909345e13fa456aef7fc03edb2ae41def1795f565af79c25aa8ce5c31'
            '41a4230954171a5ea2005161ec742b095e3acb30b1be33225d687cee6728dae3'
            'b0e423b44e139e703b5b7be92068977889b7018d4620d4bbf541f8721385c9cc')
