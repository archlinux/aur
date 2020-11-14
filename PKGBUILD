# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmflexnetserver-ipv6
pkgver=17.0.50
pkgrel=1
pkgdesc='Autodesk Network Licensing Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('gcc-libs' 'glibc')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adlmflexnetserverIPV6-17.0.50-0.x86_64.rpm')
sha256sums=('bb46691459247701b9aed3daafe731d141b915da29647e5d201d9c717f62616d')

options=(!strip)

package() {
	cp -a $srcdir/opt $pkgdir/
}

