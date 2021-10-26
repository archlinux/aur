# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com

pkgname=python-apt
pkgver=2.3.0
pkgrel=1
pkgdesc="Python binding of libapt-pkg"
arch=('any')
url="https://tracker.debian.org/pkg/python-apt"
license=('GPL2')
depends=('apt>=2.1')
makedepends=('python-setuptools' 'python-distutils-extra')
conflicts=()
options=(!emptydirs)
source=(https://salsa.debian.org/apt-team/python-apt/-/archive/${pkgver}/python-apt-${pkgver}.tar.gz)
sha512sums=('d561230f73f0e02341e920e70c2f7e99d4305919dc618e62ba1f76f41307eb367bcd301111af44b0766efb65660fac0097aec1596b2250d50fc6ab9ae14ef531')

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
