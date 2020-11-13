# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmflexnetclient
pkgver=17.0.49
pkgrel=1
pkgdesc='Autodesk Licensing Client Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('gcc-libs' 'glibc')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adlmflexnetclient-17.0.49-0.x86_64.rpm')
sha256sums=('0f4864b1351c15d398bfd8106b65b92c8300f4824ac69f7d38278ebdeb325f18')

options=(!strip)

package() {
	cp -a $srcdir/opt $pkgdir/
}

