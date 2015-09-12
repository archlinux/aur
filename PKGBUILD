# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-zope-schema' 'python2-zope-schema')
_pkgbase='zope.schema'
pkgver=4.4.2
pkgrel=1
pkgdesc="python-zope-interface extension for defining data schemas"
arch=(any)
url="https://github.com/zopefoundation/zope.schema"
license=('ZPL')
options=(!emptydirs)
install=
source=("https://github.com/zopefoundation/zope.schema/archive/${pkgver}.tar.gz")
sha256sums=('ced2d3469306cb590a5d334ae4153a9723eb9da25d61d55252c99cb4d5588258')


package_python-zope-schema() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-zope-schema() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
