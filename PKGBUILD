# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: PiC0 <guill.p.linux@gmail.com>

pkgbase=python-xmltodict
pkgname=('python-xmltodict' 'python2-xmltodict')
pkgver=0.9.2
pkgrel=1
pkgdesc="Python module that makes working with XML feel like you are working with JSON"
url="https://github.com/martinblech/xmltodict"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/x/xmltodict/xmltodict-$pkgver.tar.gz)
md5sums=('ab17e53214a8613ad87968e9674d75dd')

package_python-xmltodict () {
  pkgdesc+=" (py3)"
  depends=('python')

  cd "$srcdir/xmltodict-$pkgver"
  python setup.py install --root="${pkgdir}"
}

package_python2-xmltodict () {
  pkgdesc+=" (py2)"
  depends=('python2')

  cd "$srcdir/xmltodict-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}
