# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmflexnetclient
pkgver=23.0.21
pkgrel=1
pkgdesc='Autodesk Network Licensing Client (Deprcate on August 7, 2021)'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('gcc-libs')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmflexnetclient-$pkgver-0.x86_64.rpm")
sha256sums=('db1df02db7d3c42c65a808d6cce6262da4587515161dfd5fc55d179bdf128ac7')

options=(!strip)

package() {
	mv opt $pkgdir/
}
