# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmapps
pkgver=17.0.49
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'libglvnd' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://adlmapps17-17.0.49-0.x86_64.rpm'
		'adlmapps.install')
sha256sums=('ee98f7d23f389ef1c6f4eba438e1470c69fea9a8e3be760f05cf2c38dc4ec92a'
			'7bc66c8c907f68fadc7d1ef51032dc77234f70996c310381b14f10acc7b9b5b9')

options=(!strip)
install='adlmapps.install'

package() {
	cp -a $srcdir/opt $srcdir/var $pkgdir/
}

