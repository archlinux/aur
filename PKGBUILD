pkgname=rusted-paratrooper
pkgver=1.1.0
pkgrel=1
pkgdesc="Paratrooper clone written in Rust"
arch=('x86_64')
url='https://github.com/denix666/paratrooper'
license=('GPLv3')

source=('https://github.com/denix666/paratrooper/releases/download/v1.1.0/paratrooper_linux_x86_64.tar.gz'
	'rusted-paratrooper_icon.png'
	'rusted-paratrooper.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 paratrooper ${pkgdir}/usr/local/games/${pkgname}/paratrooper
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-paratrooper_icon.png ${pkgdir}/usr/share/pixmaps/rusted-paratrooper_icon.png
    install -D -m644 rusted-paratrooper.desktop ${pkgdir}/usr/share/applications/rusted-paratrooper.desktop
}
sha256sums=('d26d3536753969cec48dc03668eff8be4f5818fd2f0f3be14e043192f32ed881'
            '998f94879719990106179c0cdd454caad6f49ab44464afa6a332bb88d1abf62b'
            '126000ce28075170203ba7486377361b69f4b2468b473c9c95dd23b38eb8d901')
