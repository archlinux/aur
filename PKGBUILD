# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
_pkgname=config
pkgname=python2-config
pkgver=0.3.9
pkgrel=1
pkgdesc="A hierarchical, easy-to-use, powerful configuration module for Python"
arch=(any)
url="https://pypi.python.org/pypi/config"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2f901d954e9e537cc9e1050deb1f67c1')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
