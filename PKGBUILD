# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=('python-offtrac' 'python2-offtrac')
pkgver=0.1.0
pkgrel=1
pkgdesc="trac xmlrpc library"
arch=(any)
url="https://fedorahosted.org/offtrac/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.org/packages/source/o/offtrac/offtrac-$pkgver.tar.gz)

package_python-offtrac() {
  cd $srcdir/offtrac-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-offtrac() {
  cd $srcdir/offtrac-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1
}

md5sums=('6dc1019a2ba05b38dd1eed4c76567744')
