pkgname=rusted-paratrooper
pkgver=1.0.0
pkgrel=1
pkgdesc="Paratrooper clone written in Rust"
arch=('x86_64')
url='https://github.com/denix666/paratrooper'
license=('GPLv3')

source=('https://github.com/denix666/paratrooper/releases/download/v1.0.0/paratrooper.tar.gz'
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
sha256sums=('94dd09bad63a970c50cbbbd5f50a642231979a80a2bf720f752dbdf67099a1d6'
            '998f94879719990106179c0cdd454caad6f49ab44464afa6a332bb88d1abf62b'
            '126000ce28075170203ba7486377361b69f4b2468b473c9c95dd23b38eb8d901')
