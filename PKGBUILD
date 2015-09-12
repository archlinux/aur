# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-zope-configuration' 'python2-zope-configuration')
_pkgbase='zope.configuration'
pkgver=4.0.3
pkgrel=1
pkgdesc="Provides an extensible system for supporting various kinds of configurations"
arch=(any)
url="https://github.com/zopefoundation/zope.configuration"
license=('ZPL')
options=(!emptydirs)
source=("https://github.com/zopefoundation/zope.configuration/archive/${pkgver}.tar.gz")
sha256sums=('291d17d4c3f04fd8a431c14af27bd7448f60056fccd99a1b4b7c5c48363eb2b8')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-zope-configuration() {
  depends=('python' 'python-zope-i18nmessageid' 'python-zope-schema')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-zope-configuration() {
  depends=('python2' 'python2-zope-i18nmessageid' 'python2-zope-schema')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
