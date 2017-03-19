# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=('python-configshell-fb' 'python2-configshell-fb')
_pkgname=configshell-fb
pkgver=1.1.fb23
pkgrel=1
pkgdesc="python framework for building simple CLI applications (free branch)"
arch=('any')
url="https://github.com/open-iscsi/configshell-fb"
license=('Apache')
options=()
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://github.com/open-iscsi/configshell-fb/archive/v${pkgver}.tar.gz)
sha512sums=('71e2a30f3a484fb416ca8bda22c49c27a3abb8c826dc5ab06d5fe73dc0e0ccb3960934176164a9e37770b2b9ec6906ac1c922f418ef452e9f025fbb906517df1')

package_python-configshell-fb() {
  depends=('python-pyparsing' 'python-urwid')
  provides=('python-configshell')
  conflicts=('python-configshell')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-configshell-fb() {
  depends=('python2-pyparsing' 'python2-urwid')
  provides=('python2-configshell')
  conflicts=('python2-configshell')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
