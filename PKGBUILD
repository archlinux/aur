pkgname=rusted-shamus
pkgver=0.1.1
pkgrel=1
pkgdesc="Remake os the shamus game written in Rust"
arch=('x86_64')
url='https://github.com/denix666/shamus'
license=('MIT')

source=('https://github.com/denix666/shamus/releases/download/v0.1.1/shamus_linux_x86_64.tar.gz'
	'rusted-shamus_icon.png'
	'rusted-shamus.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 shamus ${pkgdir}/usr/local/games/${pkgname}/shamus
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-shamus_icon.png ${pkgdir}/usr/share/pixmaps/rusted-shamus_icon.png
    install -D -m644 rusted-shamus.desktop ${pkgdir}/usr/share/applications/rusted-shamus.desktop
}
sha256sums=('685263dae2ed8b5c57952156d52bf8e9f3e2052f04014c338677004937144505'
            '57d5647b0d9d4e691a9abbec69e0794f227b181dc5b20fcef4b2299dfc52f41b'
            '82c0d8837d08ea685ac8a0b2caf8ae8436fc7566ac6d0e2f58ab2e4189ccd87d')
