# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
pkgbase='python-epub'
pkgname=('python-epub' 'python2-epub')
_name=epub
pkgver=0.5.2
pkgrel=2
pkgdesc="Python library to open and read epub version 2 archives."
arch=('any')
url=http://pypi.python.org/pypi/epub
license=('LGPL3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
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
