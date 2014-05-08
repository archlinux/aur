# Maintainer: J. Kuske <kuskej@yahoo.com>
# Contributor: kperkins <kperkins257+gmixer@gmail.com>

pkgname=gmixer
pkgver=1.3
pkgrel=3
pkgdesc="Simple lightweight gtk/gstreamer audio mixer"
arch=('i686' 'x86_64')
url="http://launchpad.net/gmixer"
license=('GPL3')
depends=('python2' 'pygtk' 'gstreamer0.10-python>=0.10.8' 'python-xlib')
makedepends=('gettext' 'pkgconfig' 'intltool')
source=(http://launchpad.net/gmixer/1.x/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('1e0846a6f39a8476fcb1e1d4f81631b3')

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --root=$startdir/pkg || return 1
}
