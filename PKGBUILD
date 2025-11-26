pkgname=base64-converter
pkgver=0.1.4
pkgrel=1
pkgdesc="Base64 graphical text converter can convert in real time from/to base64 format"
arch=('x86_64')
url='https://github.com/denix666/base64-converter'
license=('MIT')

source=('https://github.com/denix666/base64-converter/releases/download/v0.1.4/base64-converter_linux_x86_64.tar.gz'
	'base64-converter.png'
	'base64-converter.desktop')

package() {
    cd ${srcdir}
    install -D -m755 base64-converter ${pkgdir}/usr/bin/base64-converter
    install -D -m644 base64-converter.png ${pkgdir}/usr/share/pixmaps/base64-converter.png
    install -D -m644 base64-converter.desktop ${pkgdir}/usr/share/applications/base64-converter.desktop
}
sha256sums=('7b92324d4d5ff0bad7b3c750397dcbb017729e5e29abff41bc7522fefc3e69b5'
            '0d02774f19b2ffbbd21c61735fa736dee8b90bbdf545c5f8285d587b2241d21f'
            '9a182ea3bee3dcbd6180afef4be248c93ad0d4fc591abfe822cd41aa4f3e2197')
