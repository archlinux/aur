pkgname=rusted-tetris
pkgver=0.2.1
pkgrel=1
pkgdesc="Tetris written in Rust"
arch=('x86_64')
url='https://github.com/denix666/tetris'
license=('MIT')

source=('https://github.com/denix666/tetris/releases/download/v0.2.1/tetris_linux_x86_64.tar.gz'
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
sha256sums=('4f2fc3085db15d9a51f4f1f5bfc7d11ab8b18813787c062874b45af08316964d'
            '5e7f6b69d0d26f3c9bbff52a2df17e23a66da111c2da6a706f7940ff971fc072'
            '1a0451ff538aff6225498ebb2091e8ad2ad4c7e5955b56e74a2dd3c2d089a26c')
