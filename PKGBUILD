# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.2
pkgrel=1
pkgdesc="(FR)Interface en pyqt pour overclocker/underclocker les gpu nvidia avec le pilote proprio \n(En)Python interface for overlclock/underclock your nvidia gpu with proprietary driver"
arch=(any)
url="https://github.com/RunGp/Nvidiux"
license=('GPL3')
depends=('gksu'
		 'python-psutil'
		 'tk'
		 'libva-vdpau-driver'
		 'python-pyqt4')
package()
{
	cd "$srcdir/Nvidiux-1.2"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/1.2.tar.gz)
md5sums=('70f5d27b5e250a14ba07aaf9952635a5')

