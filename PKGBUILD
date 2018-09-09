# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
_pkgname=config
pkgname=python2-config
pkgver=0.4.0
pkgrel=1
pkgdesc="A hierarchical, easy-to-use, powerful configuration module for Python"
arch=(any)
url="https://pypi.python.org/pypi/config"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('862c2579eda9798ec367a587a8ae15c8')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
