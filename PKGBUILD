# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_name=slumber
pkgname=("python-$_name" "python2-$_name")
pkgver=0.7.1
pkgrel=2
pkgdesc='A library that makes consuming a REST API easier and more convenient'
url='https://pypi.python.org/pypi/slumber/'
license=('BSD')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
md5sums=('58fe531e23b7324b9fbd3faa89a115e2')

package_python-slumber() {
  depends=('python-requests')
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}

package_python2-slumber() {
  depends=('python2-requests')
  cd $srcdir/$_name-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
