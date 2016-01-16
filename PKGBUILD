# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.1
pkgrel=1
pkgdesc="Interface en pyqt pour overclocker/underclocker les gpu nvidia avec le pilote proprio"
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
	cd "$srcdir/Nvidiux-1.1"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/1.1.tar.gz)
md5sums=('9dab348d88f0ee022e32fb1b7ef66dba')

