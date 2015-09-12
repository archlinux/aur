# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-zope-event' 'python2-zope-event')
_pkgbase='zope.event'
pkgver=4.0.3
pkgrel=1
pkgdesc="Provides a simple event system"
arch=(any)
url="https://github.com/zopefoundation/zope.event"
license=('ZPL')
options=(!emptydirs)
install=
source=("https://github.com/zopefoundation/zope.event/archive/${pkgver}.tar.gz")
sha256sums=('3dfa2ef09c891f378e05404521529f8e1333c75cdf9567a3454e3538ef7f3f02')


package_python-zope-event() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-zope-event() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
