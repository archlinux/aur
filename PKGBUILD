# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.0
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
md5sums=('8c9ed58fe1905baada46989331a54bf7')

