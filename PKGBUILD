pkgname=rusted-pacman
pkgver=1.0.3
pkgrel=1
pkgdesc="Pacman written in Rust"
arch=('x86_64')
url='https://github.com/denix666/pacman'
license=('MIT')

source=('https://github.com/denix666/pacman/releases/download/v1.0.3/rusted-pacman_linux_x86_64.tar.gz'
	'rusted-pacman_icon.png'
	'rusted-pacman.desktop')

package() {
    cd ${srcdir}
    install -D -m755 rusted-pacman ${pkgdir}/usr/local/games/rusted-pacman
    install -D -m644 rusted-pacman_icon.png ${pkgdir}/usr/share/pixmaps/rusted-pacman_icon.png
    install -D -m644 rusted-pacman.desktop ${pkgdir}/usr/share/applications/rusted-pacman.desktop
}
sha256sums=('0d31efbd080e8fdc8bc93703d490c58db217a930c7bee3cc85cd28908b2ed634'
            'd7e60e16fd55f6a3350933cc91ffa2fcb972c8df3ba869ab22576a059e3df9a9'
            'f52fe61b2ee80bcdf465d2d536ea7eefd35432f3efbd8b7b21e6a379147ab43d')
