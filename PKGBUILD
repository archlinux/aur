# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-zope-i18nmessageid' 'python2-zope-i18nmessageid')
_pkgbase='zope.i18nmessageid'
pkgver=4.0.3
pkgrel=1
pkgdesc="Message Identifiers for internationalization"
arch=(any)
url="https://github.com/zopefoundation/zope.i18nmessageid"
license=('ZPL')
options=(!emptydirs)
source=("https://github.com/zopefoundation/zope.i18nmessageid/archive/${pkgver}.tar.gz")
sha256sums=('5a273d5c10bebefc50784cd8715309e45b12c96494f74d57c23f17f514d4a8a3')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-zope-i18nmessageid() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-zope-i18nmessageid() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
