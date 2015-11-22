# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=0.99.2
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
	cd "$srcdir/Nvidiux-master"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/master.tar.gz)
md5sums=('d119767475a586d5a3406dc32bb7e1fb')

