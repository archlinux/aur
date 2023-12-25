# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adlmapps
pkgver=29.0.2
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('qt5-svg')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm")
b2sums=('334137a1b1d387ec7be33a58f8618dc1a7b948ab739ba128becb34045ae038cc0f8b4c2685b15f2f3584dabaf67cde9faf99cd5d68cd56b233c65371db5bc846')

options=(!strip)
install="${pkgname}.install"

package() {
	mv opt var "$pkgdir/"
}
