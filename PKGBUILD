pkgname=resistor
pkgver=0.1.2
pkgrel=1
pkgdesc="Resistor color code calculator written in Rust"
arch=('x86_64')
url='https://github.com/denix666/resistor'
license=('MIT')

source=('https://github.com/denix666/resistor/releases/download/v0.1.2/resistor_linux_x86_64.tar.gz'
	'resistor.png'
	'resistor.desktop')

package() {
    cd ${srcdir}
    #install -d -m755 ${pkgdir}/usr/bin
    install -D -m755 resistor ${pkgdir}/usr/bin/resistor
    install -D -m644 resistor.png ${pkgdir}/usr/share/pixmaps/resistor.png
    install -D -m644 resistor.desktop ${pkgdir}/usr/share/applications/resistor.desktop
}
sha256sums=('c098999677323eb8df40dbb70a6303887b9261c618a3a04de25ed01e7fb0b360'
            '131c599e3dbf07fae11cf1f542b3a6011c16c38b57b89833c295dc82cbea297a'
            'fcee6df8d67073bd86aabf5a590a1d587f0dadf418d7c745da8d33e73d2a53f4')
