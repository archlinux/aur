pkgname=qr_code_creator
pkgver=0.1.1
pkgrel=1
pkgdesc="QR Code creator written in Rust"
arch=('x86_64')
url='https://github.com/denix666/qr_code_creator'
license=('MIT')

source=('https://github.com/denix666/qr_code_creator/releases/download/v0.1.1/qr_code_creator_linux_x86_64.tar.gz'
	'qr_code_creator_icon.png'
	'qr_code_creator.desktop')

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/bin
    install -D -m755 qr_code_creator ${pkgdir}/usr/local/bin/qr_code_creator
    install -D -m644 qr_code_creator_icon.png ${pkgdir}/usr/share/pixmaps/qr_code_creator_icon.png
    install -D -m644 qr_code_creator.desktop ${pkgdir}/usr/share/applications/qr_code_creator.desktop
}
sha256sums=('81cc086e50a08a3e8a79ab106021c8bc5db99b1eccf4cafec26b188719a4c849'
            'e51f5a779d01b88528d49f63cb0375ad002768ac2bf61beb3451ac67af26a95f'
            '797f42566dbd802a2b0b06cacb29afdcc888d36c636f6adf12ef526397eb5e91')
