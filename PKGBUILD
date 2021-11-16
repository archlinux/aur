# Maintainer: Mike
pkgname=qzdl-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc=".desktop files for qzdl"
arch=('x86_64' 'i686')
url="http://zdl.vectec.net"
license=('GPL')
depends=('qzdl')
source=("qzdl.desktop"
        "qzdl.xpm")
sha256sums=('8cd98b6e40edf9f876fe1052677d1821adc75e31042b00c2d36ed544fdc40aa3'
            '7971cb7b0ea05b5e5b223f12b32a64ba2e5a0f38248b4aa9b9bca0fe921766d6')

package() {
	install -Dm 644 "${srcdir}"/qzdl.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm 644 "${srcdir}"/qzdl.xpm -t "${pkgdir}/usr/share/pixmaps/"
}
