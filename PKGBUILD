# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adlmapps
pkgver=30.0.15
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('qt5-svg')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm")
b2sums=('00c02a979ea3b45b6512b8703de6032367601e244448e73bde812eed098c3b7ec59817b5d906e97761ea87cfb64e1be80f5f7754394d1f4ef8597fdd407f3176')

options=(!strip)
install="${pkgname}.install"

package() {
	mv opt var "$pkgdir/"
}
