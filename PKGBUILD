pkgname=gwrite
pkgver=0.5.1
pkgrel=2
pkgdesc='simple GTK+ HTML5 rich text editor'
arch=('any')
url='http://code.google.com/p/gwrite/'
license=('LGPL')
depends=('python2' 'python2-jswebkit' 'pywebkitgtk')
makedepends=('python-distutils-extra')
source=("http://gwrite.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('c0ab3a7a3f74026db68972a205395f1a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
