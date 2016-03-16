# Maintainer: Your Name <nvidiux@rungp.redirectme.net>
pkgname=nvidiux
pkgver=1.3
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
	cd "$srcdir/Nvidiux-1.3"
	cp -r usr $pkgdir
}
source=(https://github.com/RunGp/Nvidiux/archive/1.3.tar.gz)
md5sums=('565c3b8514de877a0e1e78c9db799b9e')

