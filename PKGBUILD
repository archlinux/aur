pkgname=rusted-snake
pkgver=0.1.1
pkgrel=1
pkgdesc="Snake game written in Rust"
arch=('x86_64')
url='https://github.com/denix666/snake'
license=('MIT')

source=('https://github.com/denix666/snake/releases/download/v0.1.1/snake_linux_x86_64.tar.gz'
	'rusted-snake_icon.png'
	'rusted-snake.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 snake ${pkgdir}/usr/local/games/${pkgname}/snake
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-snake_icon.png ${pkgdir}/usr/share/pixmaps/rusted-snake_icon.png
    install -D -m644 rusted-snake.desktop ${pkgdir}/usr/share/applications/rusted-snake.desktop
}
sha256sums=('f6130a75560ab94979d30c2ba2bb9e5dd83eff31663e0640a09148abde285fab'
            '843abaa769cce4d43a9d48cc01afdd6d3a5cd61c09806df33509f03401108bad'
            '64cdd19060c20b9422d2fb855486da212686fac4d191066eb5c63fbae618c827')
