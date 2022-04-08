# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adlmapps
pkgver=25.0.3
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('fontconfig' 'libglvnd' 'libxi' 'libxrender' 'mtdev')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm"
		'adlmapps.install')
sha256sums=('f65760440786867d8bb09056d5fa3dcf1abfb9206a92ea3d030c0e7a272b5769'
			'7bc66c8c907f68fadc7d1ef51032dc77234f70996c310381b14f10acc7b9b5b9')

options=(!strip)
install='adlmapps.install'

package() {
	mv opt var $pkgdir/
}
