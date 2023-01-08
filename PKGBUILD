pkgname=rusted-space-invaders
pkgver=0.1.2
pkgrel=1
pkgdesc="Space invaders written in Rust"
arch=('x86_64')
url='https://github.com/denix666/space-invaders'
license=('MIT')

source=('https://github.com/denix666/space-invaders/releases/download/v0.1.2/space-invaders_linux_x86_64.tar.gz'
	'rusted-space-invaders_icon.png'
	'rusted-space-invaders.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 space-invaders ${pkgdir}/usr/local/games/${pkgname}/space-invaders
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-space-invaders_icon.png ${pkgdir}/usr/share/pixmaps/rusted-space-invaders_icon.png
    install -D -m644 rusted-space-invaders.desktop ${pkgdir}/usr/share/applications/rusted-space-invaders.desktop
}
sha256sums=('3136cc3c85a084d6febc6cd5753e1836853610241f38117f8e939f082ac683c8'
            '4cb7980b255c64d2bc3e4dc0e5f7015c203f704013714dfa5d166963119b0c08'
            '7c90612a5b7b070f30f294300f38dda1c11ba735f8c1b9d6a12ddc90c0715530')
