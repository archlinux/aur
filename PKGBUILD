# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-pyelasticsearch
pkgver=0.6.1
pkgrel=1
pkgdesc="Flexible, high-scale API to elasticsearch"
arch=('any')
url="https://pypi.python.org/pypi/pyelasticsearch/"
license=('BSD')
groups=()
depends=('python2' 'python2-six' 'python2-requests' 'python2-simplejson')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/pyelasticsearch/pyelasticsearch-$pkgver.tar.gz)
sha256sums=('daea4813a78949f9f1941be2c56d5abe2c99a8582350caf059804fb65788aca5')

package() {
  cd "$srcdir/pyelasticsearch-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
