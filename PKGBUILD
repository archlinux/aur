# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adlmapps
pkgver=28.0.11
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('qt5-svg')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm"
		'adlmapps.install')
sha256sums=('79a6b5c7a51731a8ad47aced2a8566902b10d875f3522881c27b75d0e5adb83e'
			'f59bfd2e62f3db4c92368d23d02e9b54f5b2a8d70c402bec347769119453b6ac')

options=(!strip)
install='adlmapps.install'

package() {
	mv opt var $pkgdir/
}
