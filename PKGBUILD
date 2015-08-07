# Maintainer: Alad Wenter
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='python-epub'
pkgname=('python-epub' 'python2-epub')
pkgver=0.5.2
pkgrel=1
pkgdesc="Python library to open and read epub version 2 archives."
arch=('any')
url=http://pypi.python.org/pypi/epub
license=('LGPL3')
source=(http://pypi.python.org/packages/source/e/epub/epub-$pkgver.tar.gz)
md5sums=('8d983520db864e1475c33412bb09f369')

package_python-epub() {
  depends=('python')

  cd epub-"$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-epub() {
  depends=('python2')

  cd epub-"$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sts=2 sw=2 et:
