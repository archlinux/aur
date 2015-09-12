# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-zope-component' 'python2-zope-component')
_pkgbase='zope.component'
pkgver=4.2.2
pkgrel=1
pkgdesc="Represents the core of the Zope Component Architecture"
arch=(any)
url="https://github.com/zopefoundation/zope.component"
license=('ZPL')
options=(!emptydirs)
source=("https://github.com/zopefoundation/zope.component/archive/${pkgver}.tar.gz")
sha256sums=('a1b0667b6167ad0ef667fcd201aacd5de84d7ae4baa2a1516080041c459a63a2')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-zope-component() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-zope-component() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
