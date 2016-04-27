# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=1.4.3
pkgrel=5
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'mplayer'
	 'pyxdg' 'pygtk' 'python2-httplib2' 'python2-pillow' 'dvgrab'
	 'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image')
optdepends=('frei0r-plugins: effects'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack')
source=(http://launchpad.net/openshot/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('5ec82a7e8b7700ee4a359458aedf19e9')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
