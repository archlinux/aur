pkgname=rusted-xonix
pkgver=0.1.2
pkgrel=1
pkgdesc="Xonix - remake of old pc game written in Rust"
arch=('x86_64')
url='https://github.com/denix666/xonix'
license=('MIT')

source=('https://github.com/denix666/xonix/releases/download/v0.1.2/xonix_linux_x86_64.tar.gz'
	'rusted-xonix_icon.png'
	'rusted-xonix.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/${pkgname}
    install -D -m755 xonix ${pkgdir}/usr/local/games/${pkgname}/xonix
    cp -r ${srcdir}/assets ${pkgdir}/usr/local/games/${pkgname}
    install -D -m644 rusted-xonix_icon.png ${pkgdir}/usr/share/pixmaps/rusted-xonix_icon.png
    install -D -m644 rusted-xonix.desktop ${pkgdir}/usr/share/applications/rusted-xonix.desktop
}
sha256sums=('9e92232023e5911b71c260c97fdde3947da0bcd0102b418ff764a1f36342a487'
            '501acf78f94c75f2131747e2214427302aa6d228f5da1cc029d7bc5ae203064c'
            '1d8b7bc4b656a36cbc2c823cf3afce6ec23528d0e791e4c7ef0135bda3ef975c')
