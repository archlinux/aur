# Maintainer: Payet Guillaume <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=2.1
pkgrel=1
pkgdesc="(En)Python interface for overclock/underclock your nvidia gpu with proprietary driver - (FR)Interface en pyqt pour overclocker/underclocker les gpu nvidia avec le pilote proprio"
arch=(any)
url="https://github.com/RunGp/Nvidiux"
license=('GPL3')
depends=('python2-psutil'
		 'tk'
		 'libva-vdpau-driver'
		 'python2-pyqt4'
		 'python2-pyqtgraph'
)
package()
{
	cd "$srcdir/Nvidiux-2.1"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/2.1.tar.gz)
md5sums=('bd6182b2f961eb9710ebacd56ccc92f1')

