pkgname=rusted-arkanoid
pkgver=0.2.2
pkgrel=1
pkgdesc="Arkanoid like game written in Rust"
arch=('x86_64')
url='https://github.com/denix666/arkanoid'
license=('GPLv3')

source=('https://github.com/denix666/arkanoid/releases/download/v0.2.2/arkanoid.tar.gz'
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
sha256sums=('b220c1de35eec506f3b28239ff67a4abcfe6f8d5d08024e18114c368f365631e'
            'e2c42b1e5758e4f454e5b28256b5b82fac751755523a5ec517b9b94c10e359b6'
            'c74c7657bb18ee332006a32114b9e910d1efe392ddf49614b2228375d4496ede')
