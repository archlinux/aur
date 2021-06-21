# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=adlmapps
pkgver=23.0.21
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('fontconfig' 'libglvnd' 'libxi' 'libxrender' 'mtdev')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm"
		'adlmapps.install')
sha256sums=('7cb91d44dac8aaf15b91b02e487975c33d0401df96956ac905ddf214c16052e4'
			'7bc66c8c907f68fadc7d1ef51032dc77234f70996c310381b14f10acc7b9b5b9')

options=(!strip)
install='adlmapps.install'

package() {
	mv opt var $pkgdir/
}
