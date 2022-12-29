pkgname=rusted-tetris
pkgver=0.3.0
pkgrel=1
pkgdesc="Tetris written in Rust"
arch=('x86_64')
url='https://github.com/denix666/tetris'
license=('MIT')

source=('https://github.com/denix666/tetris/releases/download/v0.3.0/tetris_linux_x86_64.tar.gz'
	'rusted-tetris_icon.png'
	'rusted-tetris.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 tetris ${pkgdir}/usr/local/games/${pkgname}/rusted-tetris
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-tetris_icon.png ${pkgdir}/usr/share/pixmaps/rusted-tetris_icon.png
    install -D -m644 rusted-tetris.desktop ${pkgdir}/usr/share/applications/rusted-tetris.desktop
}
sha256sums=('58af99a9489c7fa62e673dd07642583e207611b16e16c9bc4714d8dcefd31e1f'
            '5e7f6b69d0d26f3c9bbff52a2df17e23a66da111c2da6a706f7940ff971fc072'
            '1a0451ff538aff6225498ebb2091e8ad2ad4c7e5955b56e74a2dd3c2d089a26c')
