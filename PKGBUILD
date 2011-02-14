# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=1.3.0
pkgrel=2
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'pyxdg' 'pygtk' python2-httplib2 python-imaging)
optdepends=('dvgrab: for IEEE digital sources'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack' 'ladspa')
install=openshot.install
source=(http://launchpad.net/openshot/1.3/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('c44a09af0874a1612ed0693f8e369172')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
