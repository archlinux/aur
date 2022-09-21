pkgname=rusted-arkanoid
pkgver=0.1.5
pkgrel=1
pkgdesc="Arkanoid clone written in Rust"
arch=('x86_64')
url='https://github.com/denix666/arkanoid'
license=('GPLv3')

source=('https://github.com/denix666/arkanoid/releases/download/v0.1.5/arkanoid.tar.gz'
	'rusted-arkanoid_icon.png'
	'rusted-arkanoid.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 arkanoid ${pkgdir}/usr/local/games/${pkgname}/arkanoid
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-arkanoid_icon.png ${pkgdir}/usr/share/pixmaps/rusted-arkanoid_icon.png
    install -D -m644 rusted-arkanoid.desktop ${pkgdir}/usr/share/applications/rusted-arkanoid.desktop
}
sha256sums=('1065c5cc06ab55f8778e71e28cb7f2d700242de772e2b8fb3b4f395918a6c4a0'
            'e2c42b1e5758e4f454e5b28256b5b82fac751755523a5ec517b9b94c10e359b6'
            '4d925d2eda13e50a9a2b77ca5f391aedd9064e277fc06e2e8834f3bfd2b748ab')
