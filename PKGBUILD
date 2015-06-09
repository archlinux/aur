pkgname=python2-jswebkit
_srcname=python-jswebkit
pkgver=0.0.3
pkgrel=4
pkgdesc='simple GTK+ HTML5 rich text editor'
arch=('i686' 'x86_64')
url='http://code.google.com/p/gwrite/'
license=('LGPL')
depends=('python2' 'cython2')
conflicts=('python-jswebkit')
replaces=('python-jswebkit')
source=("http://gwrite.googlecode.com/files/${_srcname}-${pkgver}.tar.gz")
md5sums=('514ed4dd5e540d160fcdac9c3c607371')

build() {
  cd ${srcdir}/${_srcname}-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
