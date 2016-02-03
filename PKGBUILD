# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.2.1
pkgrel=1
pkgdesc="(En)Python interface for overlclock/underclock your nvidia gpu with proprietary driver<br />(FR)Interface en pyqt pour overclocker/underclocker les gpu nvidia avec le pilote proprio"
arch=(any)
url="https://github.com/RunGp/Nvidiux"
license=('GPL3')
depends=('gksu'
		 'python2-psutil'
		 'tk'
		 'libva-vdpau-driver'
		 'python2-pyqt4')
package()
{
	cd "$srcdir/Nvidiux-1.2.1"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/1.2.1.tar.gz)
md5sums=('0230915eef276ca9e623a3d0ff648513')

