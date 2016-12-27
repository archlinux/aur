# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.2.0
pkgrel=2
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'mplayer'
	 'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
	 'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
	 'libopenshot' 'python-pyzmq' 'qt5-webkit' 'python-setuptools')
optdepends=('frei0r-plugins: effects'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack')
makedepends=('python-setuptools')
source=("https://launchpad.net/openshot/${pkgver%.*}/$pkgver/+download/openshot-qt-$pkgver.tar.gz")
sha256sums=('8de6e193784af3b9149ea13c0552d4556df33396452360d5f9ac30682148e6f7')

package() {
  cd "$srcdir"
  python setup.py install --root="$pkgdir/" --optimize=1
}
