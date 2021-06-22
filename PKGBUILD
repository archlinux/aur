# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmflexnetserver-ipv6
pkgver=23.0.21
pkgrel=1
pkgdesc='Autodesk Network Licensing Server (Deprcate on August 7, 2021)'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('gcc-libs')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adlmflexnetserverIPV6-23.0.21-0.x86_64.rpm')
sha256sums=('cbec91d5be3751c79043164dbf02d86da85acdd72cccb1861dc0c976288d3bf2')

options=(!strip)

package() {
	mv opt $pkgdir/
}
