# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=0.99
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
	cd "$srcdir"
	cp -r usr $pkgdir
}
source=($pkgname-$pkgver.tar.gz)
md5sums=('8297da64e39b566fc18282982c8c4db3')

