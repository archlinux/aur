pkgname=rusted-pacman
pkgver=0.2.4
pkgrel=1
pkgdesc="Pacman written in Rust"
arch=('x86_64')
url='https://github.com/denix666/pacman'
license=('MIT')

source=('https://github.com/denix666/pacman/releases/download/v0.2.4/rusted-pacman.tar.gz'
	'rusted-pacman_icon.png'
	'rusted-pacman.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 rusted-pacman ${pkgdir}/usr/local/games/${pkgname}/rusted-pacman
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-pacman_icon.png ${pkgdir}/usr/share/pixmaps/rusted-pacman_icon.png
    install -D -m644 rusted-pacman.desktop ${pkgdir}/usr/share/applications/rusted-pacman.desktop
}
sha256sums=('d46769165f74eb6ff76bc1564e3576861397eb058560139d37b8b98a0c24a738'
            'd7e60e16fd55f6a3350933cc91ffa2fcb972c8df3ba869ab22576a059e3df9a9'
            'd648c355ceffaa5ea2931df3fb0b2e30c3b443debb8fcbe11d71e723911d6ac6')
