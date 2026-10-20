pkgname=redragon
pkgver=1.0.1
pkgrel=1
pkgdesc="Leds programmer for keyboard redragon K686BG-RGB-M"
arch=('x86_64')
url='https://github.com/denix666/redragon'
license=('MIT')
backup=('etc/udev/rules.d/99-redragon.rules')
source=("https://github.com/denix666/redragon/releases/download/v${pkgver}/redragon_linux_x86_64.tar.gz"
	'redragon.png'
	'redragon.desktop'
	'99-redragon.rules'
	'redragon.hook'
)

package() {
    install -Dm755 "${srcdir}/redragon" "${pkgdir}/usr/bin/redragon"
    install -D -m644 "${srcdir}/redragon.png" "${pkgdir}/usr/share/pixmaps/redragon.png"
    install -D -m644 "${srcdir}/redragon.desktop" "${pkgdir}/usr/share/applications/redragon.desktop"
    install -D -m644 "${srcdir}/99-redragon.rules" "${pkgdir}/etc/udev/rules.d/99-redragon.rules"
    install -D -m644 "${srcdir}/redragon.hook" "${pkgdir}/usr/share/libalpm/hooks/redragon.hook"
}
sha256sums=('359f5a7aafe911d6cac1af24e28eb3018f5baf58be1892ec9339393d4f293575'
            '1e8ee90dcd6e6b5d522768c5756afc5a042fbe7dd8988e936034344ed3315802'
            'ff54425d9d3270b2b1dfda76cf5d3d38a600ebe2d7e924a8cf7b584a32956fde'
            '3bef749095504112261e101b0ee0f011dbde6235206d3525c25f098b2e41c95b'
            'c59f66ea37d1990724b02251ae2ccd4b004e490d9c263f95e830b52801ba7b44')
