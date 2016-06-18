# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts at gmail dot com>
pkgname=python-ldif3
pkgver=3.2.0
pkgrel=1
pkgdesc="generate and parse LDIF data"
arch=('any')
url="https://github.com/xi/ldif3"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/xi/ldif3/archive/$pkgver.tar.gz")
md5sums=('69543c97c8f833cb8639a2fa51ad21be')

package() {
  cd "$srcdir/ldif3-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
