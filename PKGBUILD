# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=1.2.2
pkgrel=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'pyxdg')
optdepends=('dvgrab: for IEEE digital sources'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack' 'ladspa')
install=openshot.install
source=(http://launchpad.net/openshot/1.2/$pkgver/+download/$pkgname-$pkgver.tar.gz)

build() {
	cd $srcdir/$pkgname-$pkgver

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
md5sums=('36648c67c845bc7407abd55703a777be')
