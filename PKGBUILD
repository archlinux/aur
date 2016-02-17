# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.2.3
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
	cd "$srcdir/Nvidiux-1.2.3"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/1.2.3.tar.gz)
md5sums=('e0e38fb8e429ef11545711a29e5e0e73')

