# Maintainer: Johannes Wienke <languitar@semipol.de>
# Previous Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=python2-uritools
_pypiname=uritools
pkgver=2.2.0
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python2-pip')
depends=('python2' 'python2-ipaddress')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/u/${_pypiname}/${_pypiname}-$pkgver.tar.gz)
md5sums=('b233ab8184cacf75c5ab3ffd35dac066')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
