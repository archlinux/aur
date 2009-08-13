# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-osp
pkgver=1.03a
pkgrel=2
pkgdesc="Orange Smoothie Productions (OSP) is a modification for Quake 3 that adds many client and server features while still being compatable with the stock game."
url="http://en.wikipedia.org/wiki/Orange_Smoothie_Productions"
license=('')
arch=('i686' 'x86_64')
depends=('quake3')
source=('http://www.sunflow.com/orangesmoothie/downloads/osp-Quake3-1.03a_full.zip')
md5sums=('8b2b4925cce1895067bc617b86c62ea5')

build() {
	cd $startdir/src/

	# Base OSP Files	
	install -d $startdir/pkg/opt/quake3/
	unzip osp-Quake3-1.03a_full.zip -d $startdir/pkg/opt/quake3/
}
