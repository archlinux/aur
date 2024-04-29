# Maintainer: Max Harmathy <max.harmathy@web.de>
pkgname=python-stashy
pkgver=0.7
pkgrel=2
pkgdesc="Python API client for the Atlassian Stash REST API"
arch=('any')
url="https://github.com/cosmin/stashy"
license=('APACHE2')
makedepends=(
  python-mock
  python-setuptools
)
depends=(
  python-requests
  python-decorator
)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('3924ea017fc5c096928d4eefa08febf3d16279f74c5d6555481409d986498b49')

package() {
  cd "$srcdir/stashy-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

