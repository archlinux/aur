# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=zbar-desktop
pkgver=0.0.5
pkgrel=3
pkgdesc='Scan QR-Code from context menu'
arch=('any')
url='https://www.eworm.de/'
depends=('zenity' 'zbar')
license=('GPL')
source=('zbarscan'
	'zbarscan.desktop'
	'zbarscan.png')
sha256sums=('66496965e8e986fe1ce36049128806bce9bf00d38507f62587a9fb1f5189206f'
            '58ab07e2e0f40b67fd6a9d05dacc7077d2164ab3cfecaa3f9506c47b01cc9234'
            'eb35679d7c4ada4dda4e34ecb176a5717092b850e5ff3bb874997b7d0fc6de33')

package() {
	install -D -m0755 ${srcdir}/zbarscan ${pkgdir}/usr/bin/zbarscan
	install -D -m0644 ${srcdir}/zbarscan.desktop ${pkgdir}/usr/share/applications/zbarscan.desktop
	install -D -m0644 ${srcdir}/zbarscan.png ${pkgdir}/usr/share/icons/hicolor/48x48/actions/zbarscan.png
}

